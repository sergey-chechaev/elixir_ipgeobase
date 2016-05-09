# Ipgeobase

***Find Russian and Ukraine city by IP address. Source http://ipgeobase.ru/***

  ## Examples

      iex> ip = Ipgeobase.find_by_ip("46.188.121.160")
      %Ipgeobase{city: "Москва", country: "RU"}
      iex> ip.city
      "Москва"
      iex> ip.country
      "RU"

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ipgeobase to your list of dependencies in `mix.exs`:

        def deps do
          [{:ipgeobase, "~> 0.0.1"}]
        end

  2. Ensure ipgeobase is started before your application:

        def application do
          [applications: [:ipgeobase]]
        end

