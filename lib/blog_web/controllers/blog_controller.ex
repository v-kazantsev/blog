defmodule BlogWeb.BlogController do
  use BlogWeb, :controller

  alias Blog.Publications
  alias Blog.Publications.Blog

  plug BlogWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, params) do
    page = case conn.assigns[:admin] do
      true ->
        Publications.list_for_admin(params)
     _ ->
        Publications.sort_by_created(params)
    end
      render(conn, "index.html", blogs: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Publications.change_blog(%Blog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog" => blog_params}) do
    case Publications.create_blog(blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Запись создана.")
        |> redirect(to: blog_path(conn, :show, blog))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blog = Publications.get_blog!(id)
    render(conn, "show.html", blog: blog)
  end

  def edit(conn, %{"id" => id}) do
    blog = Publications.get_blog!(id)
    changeset = Publications.change_blog(blog)
    render(conn, "edit.html", blog: blog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blog" => blog_params}) do
    blog = Publications.get_blog!(id)

    case Publications.update_blog(blog, blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Запись отредактирована.")
        |> redirect(to: blog_path(conn, :show, blog))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", blog: blog, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blog = Publications.get_blog!(id)
    {:ok, _blog} = Publications.delete_blog(blog)

    conn
    |> put_flash(:info, "Запись удалена.")
    |> redirect(to: blog_path(conn, :index))
  end
end
