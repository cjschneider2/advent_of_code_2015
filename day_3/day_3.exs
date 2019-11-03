defmodule AOC2015.Day1 do

  defp p1(steps) do p1(steps, 0) end
  defp p1([], floor) do floor end
  defp p1([head | tail], floor) do
    case head do
      ?) -> p1(tail, floor - 1)
      ?( -> p1(tail, floor + 1)
    end
  end

  @doc """
  Here, we need to find how many unique houses Santa has visited
  """
  def run_part1() do
    {:ok, steps} = File.read("day-1_test-input.txt")
    IO.puts("part 1 : " <> Integer.to_string(p1(to_charlist(steps))))
  end

end

AOC2015.Day1.run_part1()
#AOC2015.Day1.run_part2()
