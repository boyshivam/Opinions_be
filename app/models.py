from sqlalchemy.orm import relationship
from sqlalchemy import Column, Integer, String, DateTime, Boolean, ForeignKey
from .database import Base
from sqlalchemy.sql import func

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key= True, nullable= False)
    username = Column(String, nullable= False, unique= True)
    password =  Column(String, nullable= False)


class Post(Base):
    __tablename__ = "posts"

    id =  Column(Integer, primary_key= True, nullable= False )
    owner_id = Column(Integer, ForeignKey("users.id"),  nullable = False)
    title = Column(String, nullable = False)
    context = Column(String, nullable = False)
    genre = Column(String, nullable = False) 
    created_at = Column(DateTime, server_default=func.now(), nullable=False)
    published = Column(Boolean, nullable= False)
    owner = relationship("User")


class Vote(Base):

    __tablename__ = "votes"

    post_id = Column(Integer, ForeignKey("posts.id", ondelete= "CASCADE"), primary_key= True)  
    user_id = Column(Integer, ForeignKey("users.id", ondelete= "CASCADE"), primary_key= True )   
