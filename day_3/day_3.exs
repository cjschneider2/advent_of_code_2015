defmodule AOC2015.Day1 do

  defp p1(steps) do p1(steps, %{}, {0, 0}, 0) end
  defp p1([], _houses, _pos, count) do count end
  defp p1([head | tail], houses, {x, y}, count) do
    cnt = case Map.fetch(houses, pos = {x, y}) do
      {:ok, cnt} -> cnt
      :error -> 0
    end
    uni = if cnt == 0 do 1 else 0 end
    next = Map.update(houses, pos, 1, fn c -> c + 1 end)
    case head do
      ?> -> p1(tail, next, {x + 1, y}, count + uni)
      ?^ -> p1(tail, next, {x, y + 1}, count + uni)
      ?< -> p1(tail, next, {x - 1, y}, count + uni)
      ?v -> p1(tail, next, {x, y - 1}, count + uni)
    end
  end

  @doc """
  Here, we need to find how many unique houses Santa has visited
  """
  def run_part1() do
    {:ok, steps} = File.read("day-3_test-input.txt")
    IO.puts("part 1 : " <> Integer.to_string(p1(to_charlist(steps))))
  end

end

AOC2015.Day1.run_part1()
#AOC2015.Day1.run_part2()
