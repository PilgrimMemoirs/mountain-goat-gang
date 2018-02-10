# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mountain_goat_gang,
  ecto_repos: [MountainGoatGang.Repo]

# Configures the endpoint
config :mountain_goat_gang, MountainGoatGang.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZmWwCYPYs031P7PqlDyiMfF4Psy0mCocisct+bzJvws0sG4v6zV1RANZDl5g0pK3",
  render_errors: [view: MountainGoatGang.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MountainGoatGang.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
