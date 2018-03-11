defmodule BlogWeb.SessionController do
  use BlogWeb, :controller

  alias Blog.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end
  def create(conn, %{"session" => session_params}) do
    case Accounts.get_admin(session_params) do
      :error ->
        conn
        |> put_flash(:error, "Ошибка. Проверьте email или пароль.")
        |> render("new.html")
      admin ->
        conn
        |> assign(:admin, admin)
        |> put_session(:admin_id, admin.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Вы успешно вошли в систему")
        |> redirect(to: blog_path(conn, :index))
    end
  end
  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: blog_path(conn, :index))
  end

end
