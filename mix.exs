defmodule YGO.MixProject do
  use Mix.Project

  def project do
    [
      app: :ygo,
      version: "0.1.2",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: "Wrapper for the Yu-Gi-Oh! Trading Card Game API",
      source_url: "https://github.com/ChristianTovar/ygo",
      docs: [
        extras: ["README.md"],
        main: "readme"
      ],
      package: package(),
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ChristianTovar/ygo"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.2"},
      {:doctor, "~> 0.15.0", only: [:test, :dev], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:git_hooks, "~> 0.5.0", only: [:test, :dev], runtime: false}
    ]
  end

  defp aliases do
    [
      ci: ["format", "credo --strict", "doctor"]
    ]
  end
end
