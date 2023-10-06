from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app, origins="*")

# Set the upload folder
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'zenith'
app.config['MYSQL_PORT'] = 3306

mysql = MySQL(app)

from router.predict import predict_bp
from router.check_db import check_db_bp
from router.devices import devices_bp
from router.form import form_bp
from router.test_route import test_route_bp

blueprints = [
    predict_bp,
    check_db_bp,
    devices_bp,
    form_bp,
    test_route_bp,
]

for blueprint in blueprints:
    app.register_blueprint(blueprint)


if __name__ == "__main__":

    app.run(port=9000, debug=True)