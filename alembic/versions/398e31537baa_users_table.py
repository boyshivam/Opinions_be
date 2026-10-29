"""users table

Revision ID: 398e31537baa
Revises: a427364c47b6
Create Date: 2026-10-29 16:12:58.133152

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '398e31537baa'
down_revision: Union[str, Sequence[str], None] = 'a427364c47b6'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.create_table("users", sa.Column("id", sa.Integer(), primary_key=True, nullable=False), 
                    sa.Column("username", sa.String(), nullable=False, unique= True), 
                    sa.Column("password", sa.String(), nullable=False),
                    sa.Column("created_at", sa.TIMESTAMP(timezone=True), server_default=sa.text("now()"), nullable=False))


def downgrade() -> None:
    """Downgrade schema."""
    pass
