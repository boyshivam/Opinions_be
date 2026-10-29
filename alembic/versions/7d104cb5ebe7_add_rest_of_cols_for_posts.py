"""add rest of cols for posts

Revision ID: 7d104cb5ebe7
Revises: 04ed603cbb21
Create Date: 2026-10-29 17:18:34.635420

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '7d104cb5ebe7'
down_revision: Union[str, Sequence[str], None] = '04ed603cbb21'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column("posts", sa.Column("published", sa.Boolean(), server_default="true", nullable=False))
    op.add_column("posts", sa.Column("created_at", sa.TIMESTAMP(timezone=True), server_default=sa.text("now()"), nullable=False))
    op.add_column("posts", sa.Column("context", sa.String(), nullable=False))




def downgrade() -> None:
    op.drop_column("posts", "published")
    op.drop_column("posts", "created_at")
    op.drop_column("posts", "context")