defmodule Day5 do

  defp contains_vowels(input, vowel_count) do

  end

  defp contains_double_letter(input) do

  end

  defp contains_forbidden_strings(input, strings) do

  end

  def run_tests() do
    {:ok, file} = File.read("day_5-test_input.txt")
    strings = file
              |> String.split(~r/\R/)
    strings
    |> Task.async_stream(fn x -> IO.puts(x) end)
    |> Enum.to_list()
  end

end

Day5.run_tests()