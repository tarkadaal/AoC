defmodule RoomTest do
  use ExUnit.Case
  doctest Room

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "Room structure" do
  	r = %Room{}
  	assert r.name == nil
  	assert r.sector == nil
  	assert r.checksum == nil
  end 

  test "Room creation" do
  	r = Room.create_from("aaaaa-bbb-z-y-x-123[abxyz]")
  	assert r.name == "aaaaa bbb z y x"
  	assert r.sector == 123
  	assert r.checksum == "abxyz"
  end
end