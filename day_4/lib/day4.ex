defmodule Day4 do
  @moduledoc """
  Documentation for Day4.
  """

  @doc """
  checks the md5 hash func for the requirement of having 5 leading zeros
  """
  def check_hash("00000" <> _rest) do
    :true end
  def check_hash(_) do
    :false end

  def check_hash2("000000" <> _rest) do
    :true end
  def check_hash2(_) do
    :false end

  @doc """
  generates the md5 hash of the input string and outputs result in base-16
  """
  def gen_hash(input) do
    :crypto.hash(:md5, input)
    |> Base.encode16(case: :lower)
  end

  @doc """
  solves the solution for part-1 of day 4 using a given key
  """
  def part_1(key) do
    part_1(key, 0)
  end
  def part_1(key, acc) do
    salt = acc |> Integer.to_string
    hash_ok = key <> salt
              |> gen_hash
              |> check_hash
    case hash_ok do
      :true -> acc |> Integer.to_string
      :false -> part_1(key, acc + 1)
    end
  end

  @doc """
  solves the solution for part-2 of day 4 using a given key
  """
  def part_2(key) do
    part_2(key, 0)
  end
  def part_2(key, acc) do
    salt = acc |> Integer.to_string
    hash_ok = key <> salt
              |> gen_hash
              |> check_hash2
    case hash_ok do
      :true -> acc |> Integer.to_string
      :false -> part_2(key, acc + 1)
    end
  end

end
