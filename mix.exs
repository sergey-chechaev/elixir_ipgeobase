defmodule Ipgeobase.Mixfile do
  use Mix.Project

  def project do
    [app: :ipgeobase,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  defp description do
    """
    Find Russian and Ukraine city by IP address. Source http://ipgeobase.ru/
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Sergey Chechaev"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/sergey-chechaev/elixir_ipgeobase",
              "Docs" => "https://hexdocs.pm/ipgeobase/0.0.1"}
     ]
  end
  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion]]
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
      {:httpotion, "~> 2.2.0"},
      {:floki, "~> 0.8"},
      {:iconv, "~> 1.0"},
      {:ex_doc, "~> 0.11", only: :dev},
    ]
  end
end
