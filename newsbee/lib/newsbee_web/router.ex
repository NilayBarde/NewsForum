defmodule NewsbeeWeb.Router do
  use NewsbeeWeb, :router

# pipeline: some preprocessing on the request
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

  scope "/", NewsbeeWeb do
    pipe_through :browser

    # get "/", TopicController, :index
    # get "/users", PageController, :index
    # get "/topics/new", TopicController, :new
    # post "/topics", TopicController, :create
    # get "topics/:id/show", TopicController, :show
    # get "topics/:id/edit", TopicController, :edit
    # delete "topics/:id/delete", TopicController, :delete
    # put "topics/:id/update", TopicController, :update

    resources "/", TopicController
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
