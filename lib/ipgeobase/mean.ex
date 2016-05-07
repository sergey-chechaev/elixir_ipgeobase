defmodule Ipgeobase.Mean do
  @city ""
  @country ""

  def mean(response) do
    Floki.find(response,"city") |> Floki.text
    city = xmlText(element, :value)  == 'Санкт-Петербург'

    IO.puts city
  end
end
