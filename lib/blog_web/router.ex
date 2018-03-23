defmodule BlogWeb.Router do
  use BlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BlogWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogWeb do
    pipe_through :browser # Use the default browser stack
    get "/", BlogController, :index
    get "/iriguchi", SessionController, :new
    post "/iriguchi", SessionController, :create
    get "/logout", SessionController, :delete
    resources "/blogs", BlogController#, except: [:index]
    get "/feedback", MailController, :new
    post "/feedback", MailController, :create
    get "/users/", UserController, :new
    post "users/", UserController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogWeb do
  #   pipe_through :api
  # end
end
