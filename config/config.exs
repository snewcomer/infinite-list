# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :infinite_list,
  ecto_repos: [InfiniteList.Repo]

# Configures the endpoint
config :infinite_list, InfiniteListWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lnGf3N4UsO+rHPOLu/6Xveq4G1RSAxeMu1WDWfDIz5VVSykP8NnMaDHoIME0s8z0",
  render_errors: [view: InfiniteListWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InfiniteList.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :infinite_list, InfiniteListWeb.Endpoint,
   live_view: [
     signing_salt: "DCYaP/LPneb7qlflhTHkE8mY+dDGmmVc"
   ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
