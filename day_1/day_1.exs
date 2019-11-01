defmodule AOC2015.Day1 do

  defp p1(steps) do p1(steps, 0) end
  defp p1([], floor) do floor end
  defp p1([head | tail], floor) do
    case head do
      ?) -> p1(tail, floor - 1)
      ?( -> p1(tail, floor + 1)
    end
  end

  defp p2(steps) do p2(steps, 0, 0) end
  defp p2(_, -1, index) do
    index
  end
  defp p2([head | tail], floor, index) do
    case head do
      ?) -> p2(tail, floor - 1, index + 1)
      ?( -> p2(tail, floor + 1, index + 1)
    end
  end

  @doc """
  In the first part for day 1 we need to calculate the final floor that Santa end up on.
  """
  def run_part1() do
    {:ok, steps} = File.read("day-1_test-input.txt")
    IO.puts("part 1 : " <> Integer.to_string(p1(to_charlist(steps))))
  end

  @doc """
  In the second part we need to find the first step where Santa goes into the basement.
  """
  def run_part2() do
    {:ok, steps} = File.read("day-1_test-input.txt")
    IO.puts("part 2 : " <> Integer.to_string(p2(to_charlist(steps))))
  end

end

AOC2015.Day1.run_part1()
AOC2015.Day1.run_part2()
