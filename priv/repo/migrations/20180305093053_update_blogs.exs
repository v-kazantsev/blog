defmodule Blog.Repo.Migrations.UpdateBlogs do
  use Ecto.Migration

  def change do
    alter table(:blogs) do
      add :category, :string
      add :status, :integer, default: 0
    end

  end
end
