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
    resources "/topics", TopicController
    resources "/comments", CommentController

  end

<<<<<<< HEAD
  scope "/", NewsbeeWeb do
    pipe_through :browser
=======
scope "/", NewsbeeWeb do
  pipe_through :browser
>>>>>>> song1205

  get "/", PageController, :index
  get "/sports", NewsController, :sports
  get "/health", NewsController, :health
  get "/business", NewsController, :business
  get "/entertainment", NewsController, :entertainment
  get "/technology", NewsController, :technology
end

scope "/topics", NewsbeeWeb do
  pipe_through :browser

  get "/", PageController, :index
end

  scope "/", NewsbeeWeb do
    pipe_through :browser

    # resources "/", NewsController
    
    # get "/*path", PageController, :index
    # get "/news/sports", NewsController, :sports
    get "/news", NewsController, :index
    get "/news/topics", PageController, :index


  end

  # Other scopes may use custom stacks.
  # scope "/api", NewsbeeWeb do
  #   pipe_through :api
  # end
end

