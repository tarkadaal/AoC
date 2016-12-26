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

  test "is fake room" do
  	room = Room.create_from "aaaaa-bbb-z-y-x-123[axbyz]"
  	assert Aoc4.real?(room) == false
  end

  test "name processor" do
  	room = Room.create_from "aaaaa-bbb-z-y-x-123[abxyz]"
  	proc = Aoc4.process_name(room.name)
  	assert proc == %{"a"=> 5, "b"=> 3, "z"=> 1, "y"=> 1, "x"=> 1}
  end

  test "rotate simple" do
  	assert Aoc4.rotate("a", 4) == "e"
  end

  test "rotate string" do
  	assert Aoc4.rotate("azm", 5) == "fer"
  end

  test "rotate many!" do
  	assert Aoc4.rotate("azm", 57) == "fer"
  end

  test "rotate leaves spaces alone" do
  	assert Aoc4.rotate("a z m", 57) == "f e r"
  end
end
