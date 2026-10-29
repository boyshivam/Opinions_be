from sqlalchemy.orm import DeclarativeBase, Session, declarative_base, sessionmaker
from sqlalchemy import engine, create_engine
from .config import settings
from sqlalchemy.engine import URL



# DATABASE_URL = f"postgresql+psycopg://{settings.db_username}:{settings.db_password}@localhost:{settings.db_port}/{settings.db_name}"

DATABASE_URL = URL.create(
    drivername="postgresql+psycopg",
    username=settings.db_username,
    password=settings.db_password,
    host=settings.db_host,
    port=settings.db_port,
    database=settings.db_name,
)


engine = create_engine(DATABASE_URL)

Base = declarative_base()

SessionLocal = sessionmaker(bind= engine, autoflush=False, expire_on_commit=False)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()