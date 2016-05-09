defmodule IpgeobaseTest do
  use ExUnit.Case
  require IEx
  doctest Ipgeobase

  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @xml """
  <ip-answer>
    <ip value="217.118.79.40">
      <inetnum>217.118.76.0 - 217.118.79.255</inetnum>
      <country>RU</country>
      <city>Санкт-Петербург</city>
      <region>Санкт-Петербург</region>
      <district>Северо-Западный федеральный округ</district>
      <lat>59.939037</lat>
      <lng>30.315784</lng>
    </ip>
  </ip-answer>
  """

  @xml_windows_1251 """
  <?xml version="1.0" encoding="windows-1251"?>
  <ip-answer>
    <ip value="217.118.79.40">
      <inetnum>217.118.76.0 - 217.118.79.255</inetnum>
      <country>RU</country>
      <city>Санкт-Петербург</city>
      <region>Санкт-Петербург</region>
      <district>Северо-Западный федеральный округ</district>
      <lat>59.939037</lat>
      <lng>30.315784</lng>
    </ip>
  </ip-answer>
  """

  test "Test parsing xml document" do
    {doc, _} = @xml |> :binary.bin_to_list |> :xmerl_scan.string
    [element] = :xmerl_xpath.string('/ip-answer/ip/city/text()', doc)
    assert xmlText(element, :value)  == 'Санкт-Петербург'
  end

  test "test parsing xml documrnt with Floki" do
    assert Floki.find(@xml, "city") |> Floki.text == "Санкт-Петербург"
  end

  test "test parsing xml documrnt with Floki windows 1251" do
    assert Floki.find(@xml_windows_1251, "city") |> Floki.text == "Санкт-Петербург"
  end

  test "Test #find_by_ip" do
    ip = Ipgeobase.find_by_ip("46.188.121.160")
    assert ip.city == "Москва"
  end

end
