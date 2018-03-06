defmodule MountainGoatGang.Router do
  use MountainGoatGang.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MountainGoatGang do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", MountainGoatGang do
     pipe_through :api

     resources "/users", UserController, except: [:new, :edit]
   end
end
