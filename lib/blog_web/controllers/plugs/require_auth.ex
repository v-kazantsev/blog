defmodule BlogWeb.Plugs.RequireAuth do

  import Plug.Conn
  import Phoenix.Controller

  alias BlogWeb.Router.Helpers

  def init(_params) do
  end
  def call(conn, _params) do
    if conn.assigns[:admin] do
      conn
    else
      conn
      |> put_flash(:error, "ДОСТУП ЗАПРЕЩЕН")
      |> redirect(to: Helpers.blog_path(conn,:index))
      |> halt()
    end
  end
end
