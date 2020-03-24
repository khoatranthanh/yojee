# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :yojee,
  ecto_repos: [Yojee.Repo]

# Configures the endpoint
config :yojee, YojeeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wjOx3uSQFiN7sEwkhUUMfj2t4eGO/W7/EtFrXZAaL6Wfn7DPk3FNKMc3k4XBxhNX",
  render_errors: [view: YojeeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Yojee.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "1QL7tcav"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
