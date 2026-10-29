from datetime import datetime, timedelta, timezone
from typing import Annotated
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from fastapi import APIRouter, Depends, HTTPException, status
from jwt import InvalidTokenError, decode, PyJWTError
from app import models, database, schemas, utils
from sqlalchemy.orm import Session
import jwt
from app.config import settings



oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")

SECRET_KEY = settings.secret_key
ALGORITHM = settings.algorithm
ACCESS_TOKEN_EXPIRE_MINUTES = settings.access_token_expire_minutes


## create access token
def create_access_token(data: dict):
    to_encode = data.copy()

    expire = datetime.now(timezone.utc) + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)

    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def verify_access_token(token: str, db: Session = Depends(database.get_db)):

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms= [ALGORITHM])
        username_p: str = payload.get("username")
        if username_p is None:
            raise HTTPException(
                404, detail="Credentials invalid"
            )
        token_data = schemas.TokenData(username = username_p)
    except InvalidTokenError:
        raise HTTPException(
                        404, detail="Credentials invalid"
                    )
    return token_data


 
def get_current_user(token: Annotated[str, Depends(oauth2_scheme)], db: Session = Depends(database.get_db) ):


    token_data = verify_access_token(token=token)

    if token_data is None:
        raise  HTTPException(
                        404, detail="Credentials invalid"
                    )        

    user = db.query(models.User).filter(models.User.username == token_data.username).first()
    

    return user








                 

            
                
            
                
            
        





    















    