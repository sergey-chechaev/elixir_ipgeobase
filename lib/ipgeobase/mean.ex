defmodule Ipgeobase.Mean do

  def set_structure(city,country) do
    %Ipgeobase{city: encode(city), country: encode(country)}
  end

  def mean(response) do
    city = Floki.find(response,"city") |> Floki.text
    country = Floki.find(response, "country") |> Floki.text
    set_structure(city, country)
  end

  def encode(entry) do
    :application.start(:iconv)
    :iconv.convert("windows-1251", "utf-8", entry)
  end
end
