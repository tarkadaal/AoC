defmodule Aoc4 do
	@input_path "./day4input.txt"

	def solve_day_1() do
		@input_path
		|> File.read!
		|> String.split
		|> Enum.map(&Room.create_from/1)
		|> Enum.filter(&real?/1)
		|> Enum.map(&(&1.sector))
		|> Enum.sum
	end

	def real?(room) do
		proc = process_name(room.name)
		my_check = proc
		|> Map.keys
		|> Enum.sort
		|> Enum.sort(&(proc[&1] >= proc[&2]))
		|> Enum.take(5)
		|> Enum.join("")
		my_check == room.checksum
	end

	def process_name(name) do
		b = String.replace(name, "-", "") |> String.graphemes 
		m = for x <- Enum.dedup(b), into: %{}, do: {x, 0}
		Enum.reduce b, m, fn(x,acc) -> %{acc | x => acc[x]+1 } end
	end

end

# Each room consists of an encrypted name (lowercase letters separated by dashes) 
# followed by a dash, a sector ID, and a checksum in square brackets
# A room is real (not a decoy) if the checksum is the five most common letters in the 
# encrypted name, in order, with ties broken by alphabetization. For example:

# aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are 
#	a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically.
# a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all 
# tied (1 of each), the first five are listed alphabetically.
# not-a-real-room-404[oarel] is a real room.
# totally-real-room-200[decoy] is not.
# Of the real rooms from the list above, the sum of their sector IDs is 1514.

# What is the sum of the sector IDs of the real rooms?
