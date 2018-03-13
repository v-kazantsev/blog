defmodule Blog.Publications.Blog do
  use Ecto.Schema
  import Ecto.Changeset


  schema "blogs" do
    field :body, :string
    field :source, :string
    field :subtitle, :string
    field :title, :string
    field :category, :string
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :subtitle, :source, :body, :category, :status])
    |> validate_required([:title, :subtitle, :source, :body])
  end
end
