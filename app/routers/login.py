from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from fastapi.security import OAuth2PasswordRequestForm
from app import oauth2, schemas, database, models, utils


router = APIRouter(
    prefix= "/login",
    tags = ["login"]
)

@router.post("/")
def login_user(user_credentials: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(database.get_db)):

    
    user = db.query(models.User).filter(
        models.User.username == user_credentials.username,
    ).first()

    if not user:
        raise HTTPException(status_code= status.HTTP_404_NOT_FOUND, detail= "user not found")

    if not utils.verifyPasscode(user_credentials.password, user.password):
        raise HTTPException(status_code= status.HTTP_401_UNAUTHORIZED, detail= "Invalid passcode")


    access_token = oauth2.create_access_token({
        "username" : user_credentials.username,
        "password" : user_credentials.password
    })

    return {
        "access_token" : access_token,
        "token_type" : "Bearer"
    }
