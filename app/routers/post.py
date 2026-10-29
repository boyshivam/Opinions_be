from typing import List

from fastapi import APIRouter, Depends, HTTPException, Query, status
from requests import Session
from sqlalchemy import select, func
from app.database import get_db
from app.models import Post, User
from app import oauth2, models
from .. import schemas

router = APIRouter(
    prefix="/post",
    tags= ['Post']
)


## fetch all posts in the db
@router.get("/", response_model= List[schemas.PostOut])
def getAllPosts(search:str = "", limit: int = Query(default = 10, ge = 0), offset: int = Query(default = 0, ge = 0),  db: Session = Depends(get_db), get_current_user: str = Depends(oauth2.get_current_user)):
    posts = db.query(models.Post,
                        func.count(models.Vote.post_id).label("Votes")).join(models.Vote, models.Vote.post_id == models.Post.id, isouter =
                                                                                          True).group_by(models.Post.id).filter(models.Post.title.contains(search)).limit(limit).offset(offset).all()
    return [
        {"post" : post, "votes" : vote}
        for post , vote in posts
    ]



## fetch a post by its id
@router.get("/{id}", )
def get_a_post(id: int, get_user: str = Depends(oauth2.get_current_user), db: Session = Depends(get_db)):


    post_votes = db.query(models.Post, 
                         func.count(models.Vote.post_id).label("Votes")).join(models.Vote,
                                                                             models.Vote.post_id ==
                                                                              models.Post.id, isouter = True).filter(models.Post.id == id).group_by(models.Post.id).first()
    if post_votes is None:
        raise HTTPException(status_code= status.HTTP_404_NOT_FOUND, detail = f"Post at id {id} does not exist")


    post, vote = post_votes

    return {"post" : post, "vote" : vote}


## create a new post
@router.post("/", response_model= schemas.PostResponse)
def createAPost(newPost: schemas.NewPost, db: Session = Depends(get_db),
                 current_user: User = Depends(oauth2.get_current_user)):

    post = Post(**newPost.model_dump())
    post.owner_id = current_user.id

    db.add(post)
    db.commit()
    db.refresh(post)

    return post


## update an existing post in db by searching id
@router.put("/{id}")
def updatePost(id: int, updatedPost: schemas.NewPost, db: Session = Depends(get_db), get_current_user: str = Depends(oauth2.get_current_user)):

    post = db.query(Post).filter(Post.id == id).first()

    if not post:
        raise HTTPException(
            status_code=404,
            detail= f"No post with id {id}"
        )

    for key, value in updatedPost.model_dump().items():
        setattr(post, key, value)

    post.commit()
    post.refresh(post)

    return post











