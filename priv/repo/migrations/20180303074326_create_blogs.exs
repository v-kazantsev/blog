defmodule Blog.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :subtitle, :string
      add :source, :string
      add :body, :text

      timestamps()
    end

  end
end
