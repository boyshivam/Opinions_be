"""editing posts table

Revision ID: a427364c47b6
Revises: 006d99e63ad5
Create Date: 2026-10-29 15:23:22.778596

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'a427364c47b6'
down_revision: Union[str, Sequence[str], None] = '006d99e63ad5'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    pass    


def downgrade() -> None:
    op.drop_column("posts", "content")
