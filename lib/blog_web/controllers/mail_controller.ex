defmodule BlogWeb.MailController do
  use BlogWeb, :controller
  alias Blog.{Mailer, Email}
  def new(conn, _params) do
    render conn, "feedback.html"
  end
  def create(conn, %{"from" => from, "email" => email, "message" => message}) do
    case send_mail(from, email, message) do
      :error ->
        render conn, :new
      _ ->
        conn
        |> put_flash(:info, "Сообщение отправлено.")
        |> redirect(to: blog_path(conn, :index))

    end
  end

  defp send_mail(from, email, message) do
    Email.feedback(from, email, message) |> Mailer.deliver_later()
  end
end
