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
    clean_body =
    Phoenix.HTML.Format.text_to_html(body, escape: false, insert_brs: false)
    |>Phoenix.HTML.safe_to_string
    model |> put_change(:body, clean_body)
  end
  defp strip_unsafe_body(model, _) do
    model
  end
end
