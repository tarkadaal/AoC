defmodule Aoc21Test do
  use ExUnit.Case
  doctest Aoc21

  test "the truth" do
    assert 1 + 1 == 2
  end
  test "instruction string parsing" do
  	input = "LLURDR"
  	parsed = Aoc21.parse(input)
  	assert parsed == [:left, :left, :up, :right, :down, :right]
  end

  test "navigation across keypad" do
  	instructions = [:left, :left, :up, :up, :right, :up, :down, :right]
  	key = Aoc21.follow_instructions_to_key instructions
  	assert key == 6
  end
end
