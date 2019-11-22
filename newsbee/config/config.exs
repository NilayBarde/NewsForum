# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :newsbee,
  ecto_repos: [Newsbee.Repo]

# Configures the endpoint
config :newsbee, NewsbeeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v3NUgkDtBUL7ChKzTdAn0I9lzNsXoSryr+eS0l8xdNVafxNhhx3uxOc+sx/aDkXd",
  render_errors: [view: NewsbeeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Newsbee.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# configure ueberauth
config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, []}

  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,

    client_id: "efa29728a066ce5131af",
    client_secret: "e4c15db340cf57cfc8ebab41481de18e123ee939"