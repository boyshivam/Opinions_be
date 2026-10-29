
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    db_username: str
    db_password: str
    db_name: str
    db_port: int
    db_host: str = "localhost"
    algorithm: str
    secret_key: str
    access_token_expire_minutes: int

    class Config:
        env_file = ".env"


settings = Settings() 






     