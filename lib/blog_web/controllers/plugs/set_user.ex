defmodule BlogWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Blog.Accounts

  def init(_params) do
  end

  def call(conn, _params) do
    admin_id = get_session(conn, :admin_id)
    admin = admin_id && Accounts.get_user!(admin_id)
    assign(conn, :admin, admin)
  end
end
