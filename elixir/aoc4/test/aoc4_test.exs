defmodule Aoc4Test do
  use ExUnit.Case
  doctest Aoc4

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "is real room" do
  	room = Room.create_from "aaaaa-bbb-z-y-x-123[abxyz]"
  	assert Aoc4.real?(room) == true
  end

  test "name processor" do
  	room = Room.create_from "aaaaa-bbb-z-y-x-123[abxyz]"
  	proc = Aoc4.process_name(room.name)
  	assert proc == %{"a"=> 5, "b"=> 3, "z"=> 1, "y"=> 1, "x"=> 1}
  end

end
