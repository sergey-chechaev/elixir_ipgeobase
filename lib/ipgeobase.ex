defmodule Ipgeobase do
  defstruct city: "", country: ""
  @initial_state "http://ipgeobase.ru:7020/geo?"

  def host, do: @initial_state

  @moduledoc false

  @doc ~S"""

  Find Russian and Ukraine city by IP address. Source http://ipgeobase.ru/

  ## Examples

      iex> ip = Ipgeobase.find_by_ip("46.188.121.160")
      %Ipgeobase{city: "Москва", country: "RU"}
      iex> ip.city
      "Москва"
      iex> ip.country
      "RU"

  """

  def find_by_ip(ip) do
    query = URI.encode_query(%{ip: ip})
    uri_query = URI.to_string(URI.parse(host <> query))
    response = HTTPotion.get(uri_query)
    Ipgeobase.Mean.mean(response.body)
  end

end
