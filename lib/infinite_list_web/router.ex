defmodule InfiniteListWeb.Router do
  use InfiniteListWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InfiniteListWeb do
    pipe_through :browser

    get "/artwork", PageController, :artwork
    live "/", SongsLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", InfiniteListWeb do
  #   pipe_through :api
  # end
end
