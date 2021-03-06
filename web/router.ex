defmodule MountainGoatGang.Router do
  use MountainGoatGang.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", MountainGoatGang do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", MountainGoatGang do
    pipe_through(:api)

    resources("/trails", TrailController, except: [:new, :edit])
    resources("/hikes", HikeController, except: [:new, :edit])
    resources("/users", UserController, except: [:new, :edit])
    resources("/groups", GroupController, except: [:new, :edit])
  end
end
