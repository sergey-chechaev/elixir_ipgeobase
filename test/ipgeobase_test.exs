defmodule IpgeobaseTest do
  use ExUnit.Case
  require IEx
  doctest Ipgeobase

  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  def sample_xml do
      """
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
  end

  test "Test parsing xml document" do
    {doc, _} = sample_xml |> :binary.bin_to_list |> :xmerl_scan.string
    [element] = :xmerl_xpath.string('/ip-answer/ip/city/text()', doc)
    assert xmlText(element, :value)  == 'Санкт-Петербург'
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
