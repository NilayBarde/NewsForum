defmodule Newsbee.Repo do
  use Ecto.Repo,
    otp_app: :newsbee,
    adapter: Ecto.Adapters.Postgres
end
