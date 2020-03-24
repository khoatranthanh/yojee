defmodule Yojee.Repo do
  use Ecto.Repo,
    otp_app: :yojee,
    adapter: Ecto.Adapters.Postgres
end
