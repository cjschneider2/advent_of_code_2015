defmodule AOC2015.Day2 do

  defp square_feet(l, w, h, acc) do
    [s1, s2, s3] = [l*w, w*h, h*l]
    smallest_side = Enum.min([s1, s2, s3])
    area = (2 * (s1 + s2 + s3))
    acc + area + smallest_side
  end

  defp ribbon(l, w, h, acc) do
    ribbon = 2 * Enum.min([l+w, w+h, h+l])
    bow = l*w*h
    acc + ribbon + bow
  end

  @doc """
  In part 1 we need to find the total number of square feet to order
  """
  def part_1() do
    {:ok, file} = File.read("day_2-test_input.txt")
    result = file
             |> String.split(~r/\R/)
             |> Enum.map(fn x -> String.split(x, "x") |> Enum.map(fn y -> String.to_integer(y) end) end)
             |> Enum.reduce(0, fn [l, w, h], acc -> square_feet(l, w, h, acc) end)
    IO.puts("part 1: " <> Integer.to_string(result) <> " square feet of wrapping paper required")
  end

  def part_2() do
    {:ok, file} = File.read("day_2-test_input.txt")
    result = file
             |> String.split(~r/\R/)
             |> Enum.map(fn x -> String.split(x, "x") |> Enum.map(fn y -> String.to_integer(y) end) end)
             |> Enum.reduce(0, fn [l, w, h], acc -> ribbon(l, w, h, acc) end)
    IO.puts("part 2: " <> Integer.to_string(result) <> " feet of ribbon required")
  end

end

AOC2015.Day2.part_1()
AOC2015.Day2.part_2()
