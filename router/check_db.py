from flask import Flask, Blueprint

check_db_bp = Blueprint('check_db',__name__)

@check_db_bp.route('/check-connection',methods = ["GET"])
def check_database_connection():
    from app import app, mysql

    with app.app_context():
        if mysql.connection is not None:
            print("Database connected")
            return "Database connected"
        else:
            print("Database not connected")
            return "Database not connected"
