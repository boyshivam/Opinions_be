"""Create posts table

Revision ID: 006d99e63ad5
Revises: 
Create Date: 2026-10-29 14:43:59.602387

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '006d99e63ad5'
down_revision: Union[str, Sequence[str], None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table("posts", sa.Column("id", sa.Integer(), 
                                       primary_key=True, nullable= False), 
                                       sa.Column("title", sa.String(), 
                                                 nullable= False))
    pass


def downgrade() -> None:
    """Downgrade schema."""
    pass
