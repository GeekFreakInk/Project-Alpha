from flask_restful import Resource
from flask import request
from models import db, User


class Register(Resource):

    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0,len(users)):
            user_list.append(users[i].serialize())
        return {"status": str(user_list)}, 200
    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return { "message" : "No input data provided"}, 400
        
        user = User.query.filter_by(userName=json_data['userName']).first()
        if user:
            return {'message': 'User already exists'}, 400
        
        id = json_data["id"]
        apiKey = json_data["apiKey"]
        email = json_data["email"]
        userName = json_data["userName"]
        isTeacher = json_data["isTeacher"]

        user = User(
            id = json_data["id"],
            apiKey = json_data["apiKey"],
            email=json_data["email"],
            userName=json_data["userName"],
            isTeacher=json_data["isTeacher"]
        )
        db.session.add(user)
        db.session.commit()

        result = User.dump(user)

        return { "status": 'success', 'data': result }, 201
        