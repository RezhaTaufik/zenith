import cv2
import json
import os 
import numpy as np
import tensorflow as tf
from flask import Flask, request, jsonify
from PIL import Image
from keras.models import load_model

from flask_mysqldb import MySQL

from werkzeug.utils import secure_filename
import os
from datetime import datetime

app = Flask(__name__)

# Set the upload folder
UPLOAD_FOLDER = 'uploads'

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'zenith'
app.config['MYSQL_PORT'] = 3306

mysql = MySQL(app)

# Load the model
model_path = './model/model_v1.3.h5'

model = tf.keras.models.load_model(model_path, compile=False)

# Define allowed extensions for image files
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}

# Function to check if the file has an allowed extension
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/check-connection")
def check_database_connection():
    with app.app_context():
        if mysql.connection is not None:
            print("Database connected")
            return "Database connected"
        else:
            print("Database not connected")
            return "Database not connected"



@app.route("/devices", methods=["GET"])
def list_devices():
    try:
        # Retrieve the selected location from the request
        location = request.args.get("location")

        if location:
            # Perform database operations to retrieve devices based on the selected location
            devices = retrieve_devices_by_location(location)

            return jsonify({"devices": devices})
        else:
            return jsonify({"error": "Location not provided."})

    except Exception as e:
        return jsonify({"error": str(e)})


def retrieve_devices_by_location(location):
    try:
        cursor = mysql.connection.cursor()

        sql_query = "SELECT Main.Object_Name, detailed_Type.Type_Desc FROM Main " \
            "INNER JOIN Type ON Main.Object_Name = Type.Object_Name " \
            "INNER JOIN detailed_Type ON Type.Type_ID = detailed_Type.Type_ID " \
            "WHERE Main.lokasi = %s"

        cursor.execute(sql_query, (location,))
        devices = cursor.fetchall()
        cursor.close()

        if devices:
            return [{"device": device[0], "detailed_type": device[1]} for device in devices]
        else:
            return []

    except Exception as e:
        return []


@app.route("/form", methods=["POST"])
def form():
    try:
        data = request.get_json()  # Assuming the user sends a JSON payload with the selected location and device
        location = data.get("location")
        device = data.get("device")
        device_type = data.get("device_type")

        if location and device and device_type:
            # Perform database operations to retrieve energy usage based on the selected location, device, and device type
            energy_usage = calculate_energy_usage(location, device, device_type)

            return jsonify({"energy_usage": energy_usage})
        else:
            return jsonify({"error": "Incomplete data. Please provide the location, device, and device_type."})

    except Exception as e:
        return jsonify({"error": str(e)})


def calculate_energy_usage(location, device, device_type):
    try:
        # Query to retrieve the object name based on the selected location
        cursor = mysql.connection.cursor()
        sql_query = "SELECT Object_Name FROM Main WHERE lokasi = %s"
        cursor.execute(sql_query, (location,))

        object_names = cursor.fetchall()

        if object_names:
            object_name = object_names[0][0]

            # Query to retrieve the detailed type based on the selected device
            sql_query = "SELECT detailed_Type.Type_Desc FROM detailed_Type INNER JOIN Type ON detailed_Type.Type_ID = Type.Type_ID INNER JOIN Main ON Type.Object_Name = Main.Object_Name WHERE Main.Object_Name = %s"
            cursor.execute(sql_query, (object_name,))
            detailed_types = cursor.fetchall()

            if detailed_types:
                detailed_type = detailed_types[0][0]

                # Query to retrieve the energy consumption based on the selected detailed type
                sql_query = "SELECT Energy.Energy_Consumed FROM Energy INNER JOIN detailed_Type ON Energy.Type_ID = detailed_Type.Type_ID WHERE detailed_Type.Type_Desc = %s"
                cursor.execute(sql_query, (detailed_type,))
                energy_consumed = cursor.fetchall()

                if energy_consumed:
                    energy_usage = energy_consumed[0][0]
                    return {"location": location, "device": device, "device_type": device_type, "energy_usage": energy_usage}
                else:
                    return {"error": "Energy consumption not found for the selected detailed type."}
            else:
                return {"error": "Detailed type not found for the selected device."}
        else:
            return {"error": "Object name not found for the selected location."}

    except Exception as e:
        return {"error": str(e)}

@app.route("/predict", methods=["POST"])
def predict():
    try:
        class_labels = ['Air Conditioner', 'Hair Dryer', 'Iron', 'Lamp', 'Laptop', 'Oven', 'Refrigerator', 'Rice Cooker', 'Television', 'Vacuum Cleaner', 'Washing Machine']
        # Check if the POST request contains a file part
        if 'file' not in request.files:
            return jsonify({"error": "No file part in the request."})

        file = request.files['file']
        
        # Check if a file was uploaded and has an allowed extension
        if file.filename == '':
            return jsonify({"error": "No file selected."})
        if not allowed_file(file.filename):
            return jsonify({"error": "Invalid file type. Only PNG and JPEG images are allowed."})

        # Save the uploaded file to the upload folder
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        # Load the uploaded image and preprocess it
        img = Image.open(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        img = img.resize((224, 224))
        img_array = np.array(img)
        img_array = img_array / 255.0
        img_array = np.expand_dims(img_array, axis=0)

        # Make predictions with the model
        predictions = model.predict(img_array)
        predicted_class_index = np.argmax(predictions[0])
        predicted_class = class_labels[predicted_class_index]
        confidence = predictions[0][predicted_class_index] * 100
        result = "This image most likely belongs to {} with a {:.2f} percent confidence.".format(predicted_class, confidence)

        # Get the current time
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # Perform database operations
        cursor = db.cursor()
        # Query the database based on the prediction result
        sql_query = "SELECT * FROM Main WHERE Object_Name = %s"
        cursor.execute(sql_query, (predicted_class,))  # Pass the predicted class as a parameter
        item = cursor.fetchone()  # Retrieve the first matching item

        if item:
            item_info = {
                "name": item[0],
                "Image": item[1],
                "Dampak Produksi": item[7],
                "Dampak Konsumsi": item[8],
                "Dampak Disposal": item[9],
                "Lokasi": item[10],
                "Average Energy": item[6],
                "Sumber": item[11],
                "recommendations": get_recommendations(predicted_class)  # Add recommendations based on the predicted class
                # Add more fields as needed
            }

            return jsonify({"result": result, "item_info": item_info, "time": current_time})
        else:
            return jsonify({"result": result, "item_info": None, "time": current_time})

    except Exception as e:
        return jsonify({"error": str(e)})



def get_recommendations(predicted_class):
    if predicted_class == 'Air Conditioner':
        return "R-38 AC"
    elif predicted_class == 'Oven':
        return "Less Than or Equal to 1 Cubic Ft Oven"
    elif predicted_class == 'Lamp':
        return "E17"
    else:
        return "No recommendations at this time"


if __name__ == "__main__":

    app.run(port=9000, debug=True)