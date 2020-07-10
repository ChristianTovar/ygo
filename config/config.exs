import Config

if Mix.env() != :prod do
  config :git_hooks,
    auto_install: true,
    verbose: true,
    hooks: [
      pre_commit: [
        tasks: [
          {:cmd, "mix format"},
          {:cmd, "mix credo --strict"}
        ]
      ],
      pre_push: [
        verbose: false,
        tasks: [
          {:cmd, "mix doctor"},
          {:cmd, "mix test"},
          {:cmd, "echo 'Awesome Commit! 😎👍'"}
        ]
      ]
    ]
end
