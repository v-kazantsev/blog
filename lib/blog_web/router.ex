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
    resources "/users", UserController, only: [:index, :show, :new, :create]
    get "/feedback", MailController, :new
    post "/feedback", MailController, :create
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", BlogWeb do
  #   pipe_through :api
  # end
end
