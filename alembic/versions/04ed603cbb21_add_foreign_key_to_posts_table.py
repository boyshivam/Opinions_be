"""add foreign key to posts table

Revision ID: 04ed603cbb21
Revises: 398e31537baa
Create Date: 2026-10-29 17:01:18.490598

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '04ed603cbb21'
down_revision: Union[str, Sequence[str], None] = '398e31537baa'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Upgrade schema."""
    op.add_column("users", sa.Column("created_at",
                                      sa.TIMESTAMP(timezone=True), 
                                      server_default=sa.text("now()"), 
                                      nullable= False ))
    op.add_column("posts", sa.Column("owner_id", sa.Integer(), nullable=False)),
    op.create_foreign_key("posts_users_fk", source_table= "posts", referent_table= "users", local_cols=["owner_id"], remote_cols=["id"],ondelete="CASCADE" )


def downgrade() -> None:
    """Downgrade schema."""
    op.drop_constraint("posts_users_fk", table_name= "posts")
    op.drop_column("posts", "owner_id")
    
