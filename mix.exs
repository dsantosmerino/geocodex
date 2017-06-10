defmodule Geocodex.Mixfile do
  use Mix.Project

  def project do
    [app: :geocodex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     deps: deps(),
     name: "Geocodex",
     package: package(),
     source_url: "https://github.com/dsantosmerino/geocodex"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:httpoison],
      env: [
        api_key: nil,
        geocode_api_url: "https://maps.googleapis.com/maps/api/geocode",
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.1"},
    ]
  end

  defp description do
    "A Google Geocoding API wrapper"
  end

  defp package do
    [
      maintainers: ["David Santos Merino"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dsantosmerino/geocodex"}
    ]
  end
end
