defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "md5 hash matches" do
    hash_ok = "000001dbbfa3a5c83a2d506429c7b00e"
    assert Day4.check_hash(hash_ok) == :true
  end

  test "md5 hash fails to match" do
    hash_bad = "100001dbbfa3a5c83a2d506429c7b00e"
    assert Day4.check_hash(hash_bad) == :false
  end

  test "part_1 returns correct string value" do
    key = "abcdef"
    assert "609043" == Day4.part_1(key, 609042)
  end

  test "key: abcdef has ans: 609043" do
    key = "abcdef"
    ans = "609043"
    hash = Day4.gen_hash(key <> ans)
    ans_p1 = Day4.part_1(key)
    hash_p1 = Day4.gen_hash(key <> ans_p1)
    assert hash == hash_p1
  end

  test "key: pqrstuv has ans: 1048970" do
    key = "pqrstuv"
    ans = "1048970"
    hash = Day4.gen_hash(key <> ans)
    ans_p1 = Day4.part_1(key, 1048960)
    hash_p1 = Day4.gen_hash(key <> ans_p1)
    assert hash == hash_p1
  end

  test "part 1 answer is 346386" do
    key = "iwrupvqb"
    ans = Day4.part_1(key)
    hash = Day4.gen_hash(key <> ans)
    assert "346386" == ans
    assert "0000045c5e2b3911eb937d9d8c574f09" == hash
  end

  test "part 2 answer is 42" do
    key = "iwrupvqb"
    ans = Day4.part_2(key)
    hash = Day4.gen_hash(key <> ans)
    assert "9958218" == ans
    assert "00000094434e1914548b3a1af245fb27" == hash
  end
end
