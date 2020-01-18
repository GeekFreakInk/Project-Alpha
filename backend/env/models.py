from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):

    __tablename__ = 'users'
    
    id = db.Column(db.String(), primary_key=True)
    apiKey = db.Column(db.String())
    email = db.Column(db.String(), unique=True)
    userName = db.Column(db.String(), unique=True)
    isTeacher = db.Column(db.Boolean(), default=False)

    def __init__(self, id, apiKey, email, userName, isTeacher):
        self.id = id,
        self.apiKey = apiKey
        self.email = email
        self.userName = userName
        self.isTeacher = isTeacher

    def __repr__(self):
        return "<id {}>".format(self.id)
    
    def serialize(self):
        return{
            "id" : self.id,
            "apiKey" : self.apiKey,
            "email" : self.email,
            "userName" : self.userName,
            "isTeacher" : self.isTeacher
        }

