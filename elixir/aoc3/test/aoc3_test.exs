defmodule Aoc3Test do
  use ExUnit.Case
  doctest Aoc3

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "horizontal tokenizer" do
  	result = Aoc3.tokenize_horizontal("12 13 14\n1 2 3\n")
  	assert length(result) == 2
  	assert hd(result) == [12,13,14]
  end

  test "vertical tokenizer" do
  	result = Aoc3.tokenize_vertical("1 2 3\n4 5 6\n7 8 9\n")
  	assert length(result)
  	assert hd(result) == [1,4,7]
  end

  test "check triangles" do
  	assert Aoc3.is_triangle_valid([1,2,42]) == false
  	assert Aoc3.is_triangle_valid([10,11,12]) ==true
  end

  test "arrange by triangle" do
  	result = Aoc3.arrange_by_triangle ["1 2 3","4 5 6","7 8 9","10 11 12","13 14 15","16 17 18"]
  	assert result == ["1","4","7","10","13","16","2","5","8","11","14","17","3","6","9","12","15","18"]
  end
end