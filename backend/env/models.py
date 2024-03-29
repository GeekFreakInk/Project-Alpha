from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):

    __tablename__ = 'users'
    
    id = db.Column(db.String(), primary_key=True)
    userName = db.Column(db.String(), unique=True)
    isTeacher = db.Column(db.Boolean(), default=False)
    isAdmin = db.Column(db.Boolean(), default=False)

    def __init__(self, id, userName, isTeacher, isAdmin):
        self.id = id,
        self.userName = userName
        self.isTeacher = isTeacher
        self.isAdmin = isAdmin

    def __repr__(self):
        return "<id {}>".format(self.id)
    
    def serialize(self):
        return{
            "id" : self.id,
            "userName" : self.userName,
            "isTeacher" : self.isTeacher,
            "isAdmin" : self.isAdmin
        }
    

