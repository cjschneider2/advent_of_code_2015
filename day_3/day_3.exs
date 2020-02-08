defmodule AOC2015.Day3 do

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


  defmodule Count do
    defstruct [s: 0, r: 0]
  end

  defp p2(steps) do p2(steps, %{}, {0, 0}, {0, 0}, %Count{}) end
  defp p2([], _h, _s_p, _r_p, c = %Count{}) do
    c.s + c.r
  end
  defp p2([s_dir | [r_dir | tail]], h, s_p = {sx, sy}, r_p = {rx, ry}, cnt) do
    next = Map.update(h, s_p, 1, fn c -> c + 1 end)
    s_u = if Map.fetch!(next, s_p) == 1 do 1 else 0 end
    next = Map.update(next, r_p, 1, fn c -> c + 1 end)
    r_u = if Map.fetch!(next, r_p) == 1 do 1 else 0 end
    s_pos = case s_dir do
      ?> -> {sx + 1, sy}
      ?^ -> {sx, sy + 1}
      ?< -> {sx - 1, sy}
      ?v -> {sx, sy - 1}
    end
    r_pos = case r_dir do
      ?> -> {rx + 1, ry}
      ?^ -> {rx, ry + 1}
      ?< -> {rx - 1, ry}
      ?v -> {rx, ry - 1}
    end
    case r_dir do
      ?> -> p2(tail, next, s_pos, r_pos, %Count{cnt | s: cnt.s + s_u, r: cnt.r + r_u} )
      ?^ -> p2(tail, next, s_pos, r_pos, %Count{cnt | s: cnt.s + s_u, r: cnt.r + r_u} )
      ?< -> p2(tail, next, s_pos, r_pos, %Count{cnt | s: cnt.s + s_u, r: cnt.r + r_u} )
      ?v -> p2(tail, next, s_pos, r_pos, %Count{cnt | s: cnt.s + s_u, r: cnt.r + r_u} )
    end
  end

  @doc """
  Here, we need to find how many unique houses both Santa and
  Robo-Santa have visited
  """
  def run_part2() do
    {:ok, steps} = File.read("day-3_test-input.txt")
    IO.puts("part 2 : " <> Integer.to_string(p2(to_charlist(steps))))
  end

end

AOC2015.Day3.run_part1()
AOC2015.Day3.run_part2()
