defmodule NewsbeeWeb.Router do
  use NewsbeeWeb, :router

pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/ajax", NewsbeeWeb do
    pipe_through :ajax

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:create], singleton: true

  end

  scope "/", NewsbeeWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", NewsbeeWeb do
  #   pipe_through :api
  # end
end
