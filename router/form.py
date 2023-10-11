from flask import Flask,Blueprint,jsonify,request

form_bp = Blueprint('form',__name__)

@form_bp.route('/form',methods = ['POST'])
def form():
    try:
        data = request.get_json()  # Assuming the user sends a JSON payload with the selected location and device
        location = data.get("location")
        device = data.get("device")
        device_type = data.get("device_type")

        if location and device and device_type:
            # Perform database operations to retrieve energy usage based on the selected location, device, and device type
            energy_usage = calculate_energy_usage(location, device, device_type)

            return jsonify({
                "energy_usage": energy_usage
            })
            
        else:
            return jsonify({
                "error": "Incomplete data. Please provide the location, device, and device_type."
            })

    except Exception as e:
        return jsonify({
            "error": str(e)
        })


def calculate_energy_usage(location, device, device_type):
    try:
        # Query to retrieve the object name based on the selected location
        from app import mysql
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
