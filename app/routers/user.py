from fastapi import APIRouter, Depends, HTTPException
from .. import schemas, utils
from sqlalchemy.orm import Session
from app.database import get_db
from app.models import User
from sqlalchemy import select


router = APIRouter(
    prefix= "/user",
    tags= ["User"]
)


## add a new user
@router.post("/", response_model= schemas.UserResponse)
def addUser(new_user: schemas.NewUser, db: Session = Depends(get_db)):

    unhashedPasscode = new_user.password

    hashedPass = utils.hashPasscode(unhashedPasscode)

    user = User(
        username = new_user.username,
        password = hashedPass,

    
    )

    db.add(user)
    db.commit()
    db.refresh(user)

    newly_added_user = db.query(User).filter(User.username == new_user.username).first()
    
    user.id = newly_added_user.id
    
    
    return user


## fetch a single user by id
@router.get("/{id}")
def fetchUser(id: int, db: Session = Depends(get_db)):

    user = db.scalar(select(User).where(User.id == id))

    if not user:
        raise HTTPException(status_code = 404, detail=f"User with id {id} does not exist")
    return user





## fetch all users in database
@router.get("/")
def fetchAllUsers(db: Session = Depends(get_db)):

    all_users = db.query(User).all()

    if not all_users:
        raise HTTPException(status_code=404, details = "No users in db")

    return all_users    


## update a user details
@router.put("/{id}")
def editUser(updatedData: schemas.NewUser, id: int, db: Session  = Depends(get_db)):


    user = db.query(User).filter(User.id == id).first()

    if user is None:
        raise HTTPException(status_code= 404, detail=f"User at id {id} does not exist")


    for key, value in updatedData.model_dump().items():
        setattr(user, key, value)

    db.commit()
    db.refresh(user)

    return user



## delete a user
@router.delete("/{id}")
def deleteUser(id: int, db: Session = Depends(get_db)):


    user = db.query(User).filter(User.id == id).first()

    if not user:
        raise HTTPException(
            404, detail=f"No user exists in id {id}"
        )

    db.delete(user)
    db.commit()


    return {
        "deleted user" : user
    }





    
        




    




    








