from flask import Flask,jsonify,Blueprint,request

from werkzeug.utils import secure_filename
import os
from datetime import datetime
import numpy as np
import tensorflow as tf
from keras.models import load_model
from PIL import Image


predict_bp = Blueprint("predict",__name__)

@predict_bp.route('/predict',methods = ['POST'])
def predict():
    try:
        # Load the model
        from app import app, mysql

        model_path = './model/model_v1.3.h5'

        model = tf.keras.models.load_model(model_path, compile=False)

        class_labels = ['Air Conditioner', 'Hair Dryer', 'Iron', 'Lamp', 'Laptop', 'Oven', 'Refrigerator', 'Rice Cooker', 'Television', 'Vacuum Cleaner', 'Washing Machine']
        # Check if the POST request contains a file part
        if 'file' not in request.files:
            return jsonify({
                "error": "No file part in the request."
            })

        file = request.files['file']
        
        # Check if a file was uploaded and has an allowed extension
        if file.filename == '':
            return jsonify({
                "error": "No file selected."
            })
        if not allowed_file(file.filename):
            return jsonify({
                "error": "Invalid file type. Only PNG and JPEG images are allowed."
            })

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
        cursor = mysql.connection.cursor()
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

            return jsonify({
                "result": result, 
                "item_info": item_info,
                "time": current_time
            })
        else:
            return jsonify({
                "result": result,
                "item_info": None,
                "time": current_time
            })

    except Exception as e:
        return jsonify({
            "error": str(e)
        })

# Function to check if the file has an allowed extension
def allowed_file(filename):
    # Define allowed extensions for image files
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def get_recommendations(predicted_class):
    if predicted_class == 'Air Conditioner':
        return "R-38 AC"
    elif predicted_class == 'Oven':
        return "Less Than or Equal to 1 Cubic Ft Oven"
    elif predicted_class == 'Lamp':
        return "E17"
    else:
        return "No recommendations at this time"

