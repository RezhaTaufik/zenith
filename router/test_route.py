from flask import Flask,Blueprint,jsonify

test_route_bp = Blueprint('test_route',__name__)

@test_route_bp.route('/about-test',methods = ['GET'])
def about_handler():
    return jsonify({
        'message':'this is about route'
    })