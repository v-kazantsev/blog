defmodule Blog.Repo.Migrations.AddAdmin do
  use Ecto.Migration
  alias Blog.Repo
  def change do
    Repo.insert!(%Blog.Accounts.User{
      email: "admin@test.com",
      password_hash: "$2b$12$Yv6wBB7RTBZ6gzvs.p9o1e8xjCiIMc.Vr.eVM2O800QYtObmZwySi"
      })
  end
end
