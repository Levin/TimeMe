import Config

config :timeme,
      ecto_repos: [Timeme.Repo]




config :timeme, Timeme.Repo,
  database: "timeme_repo",
  username: "lein",
  password: "",
  hostname: "localhost"
