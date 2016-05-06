defmodule Ipgeobase do
  @initial_state "http://ipgeobase.ru:7020/geo"

  def host, do: @initial_state

  def find_by_ip(ip) do
    IO.puts(ip)
  end
end
