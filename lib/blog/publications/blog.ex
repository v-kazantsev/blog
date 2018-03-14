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
    field :image, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :subtitle, :source, :body, :category, :status, :image])
    |> validate_required([:title, :subtitle, :source, :body])
    |> strip_unsafe_body(attrs)
  end
  defp strip_unsafe_body(model, %{"body" => nil}) do
    model
  end
  defp strip_unsafe_body(model, %{"body" => body}) do
    {:safe, clean_body} = Phoenix.HTML.html_escape(body)
    model |> put_change(:body, clean_body)
  end
  defp strip_unsafe_body(model, _) do
    model
  end
end
