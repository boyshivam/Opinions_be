from pwdlib import PasswordHash
from fastapi import HTTPException

password_hash = PasswordHash.recommended()


## hash an entered passcode
def hashPasscode(passcode: str) -> str:
    return password_hash.hash(passcode)


## enter the verified passcode
def verifyPasscode(attempedPasscode: str, hashedPasscode: str):
    return password_hash.verify(attempedPasscode, hashedPasscode)



