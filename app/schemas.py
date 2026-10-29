from typing import Annotated

from pydantic import BaseModel, EmailStr, Field
from pydantic.types import conint


class NewUser(BaseModel):
    username: str 
    password: str


class UserResponse(BaseModel):
    username: str = EmailStr
    id: int


class NewPost(BaseModel):
    title: str 
    context: str
    genre: str
    published: bool = True


class PostResponse(BaseModel):
    title: str
    context: str
    genre: str

class PostOut(BaseModel):
    post: NewPost
    votes: int

class TokenData(BaseModel):
    username: str


class Token(BaseModel):
    access_token: str
    token_type: str        

class Vote(BaseModel):
    post_id: int
    dir: Annotated[int, Field(ge=0, le=1)]


