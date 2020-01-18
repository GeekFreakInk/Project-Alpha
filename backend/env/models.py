from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'users'
    __table_args__ = tuple(db.uniqueConstraint("id", "username", name = "my_2uniq"))
    
    id = db.Column(db.String(), primary_key=True)
    apiKey = db.Column(db.String())
    username = db.Column(db.String(), unique=True)
    isTeacher = db.Column(db.Boolean(), default=False)

    def __init__(self, id, apiKey, username, isTeacher):
        self.id = id
        self.apiKey = apiKey
        self.username = username
        self.isTeacher = isTeacher

    def __repr__(self):
        return "<id {}>".format(self.id)
    
    def serialize(self):
        return{
            "id" : self.id,
            "api_Key" : self.apiKey,
            "username" : self.username,
            "isTeacher" : self.isTeacher
        }