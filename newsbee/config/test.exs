use Mix.Config

# Configure your database
config :newsbee, Newsbee.Repo,
  username: "newsbee",
  password: "8r5QFSKfYgrsaeX4",
  database: "newsbee_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :newsbee, NewsbeeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
