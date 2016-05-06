defmodule Ipgeobase do
  @initial_state "http://ipgeobase.ru:7020/geo?"

  def host, do: @initial_state

  def find_by_ip(ip) do
    query = URI.encode_query(%{ip: ip})
    uri_query = URI.to_string(URI.parse(host <> query))
    response = HTTPotion.get(uri_query)
    Ipgeobase.Mean.mean(response.body)
  end
end
