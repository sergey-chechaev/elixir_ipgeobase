defmodule Ipgeobase.Mean do

  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")
  def mean(response) do
    IO.puts "hello"
    {doc, _} = response |> :binary.bin_to_list |> :xmerl_scan.string
    [element] = :xmerl_xpath.string('/ip-answer/ip/city/text()', doc)
    city = xmlText(element, :value)  == 'Санкт-Петербург'

    IO.puts city
  end
end
