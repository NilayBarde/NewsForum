defmodule NewsbeeWeb.Router do
  use NewsbeeWeb, :router
  import Plug.Conn


# pipeline: some preprocessing on the request
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
    pipe_through :ajax

    get "/", TopicController, :index
    get "/users", PageController, :index
    get "/topics/new", TopicController, :new
    post "/topics", TopicController, :create
    get "topics/:id/show", TopicController, :show
    get "topics/:id/edit", TopicController, :edit
    delete "topics/:id/delete", TopicController, :delete
    put "topics/:id/update", TopicController, :update

    # resources "/", TopicController
    # get "/*path", PageController, :index
    get "/login", PageController, :index
  end


   scope "/auth", NewsbeeWeb do
     pipe_through :browser

     get "/:provider", AuthController, :request    # request function is defined automatically by ueberauth module
     get "/:provider/callback", AuthController, :callback
   end

  # Other scopes may use custom stacks.
  # scope "/api", NewsbeeWeb do
  #   pipe_through :api
  # end
end
