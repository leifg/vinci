defmodule Vinci.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vinci,
      version: "0.0.1",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      deps: deps,
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:poison, "~> 1.5"},
      {:httpoison, "~> 0.7"},
      {:mix_test_watch, "~> 0.2", only: :dev},
    ]
  end

  defp package do
    [
      contributors: ["Leif Gensert"],
      licenses: ["MIT"],
      links: [
        {"GitHub", "https://github.com/leifg/vinci"}
      ]
    ]
  end
end
