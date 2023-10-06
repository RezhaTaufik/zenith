from flask import Flask,Blueprint,jsonify

devices_bp = Blueprint('devices',__name__)

@devices_bp.route('/devices/<loc>',methods=['GET'])
def list_devices(loc):
    try:
        # Retrieve the selected location from the request
        location = loc
        print(f"location: {location}")
        

        if location:
            # Perform database operations to retrieve devices based on the selected location
            devices = retrieve_devices_by_location(location)

            return jsonify({
                "devices": devices
            })
        else:
            return jsonify({
                "error": "Location not provided."
            })

    except Exception as e:
        return jsonify({
            "error": str(e)
        })


def retrieve_devices_by_location(location):
    try:
        from app import mysql
        
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