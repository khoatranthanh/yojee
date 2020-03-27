defmodule YojeeWeb.Router do
  use YojeeWeb, :router

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

  # Other scopes may use custom stacks.
  scope "/api", YojeeWeb do
    pipe_through :api

    resources "/tweets", TweetController, only: [:index, :create, :update]
  end

  scope "/", YojeeWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
