defmodule Blog.Repo.Migrations.AddImageToBlogs do
  use Ecto.Migration

  def change do
    alter table(:blogs) do
      add :image, :string
    end
  end
end
