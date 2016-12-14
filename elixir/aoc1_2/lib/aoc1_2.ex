defmodule Aoc12 do
	@input "R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1"

	def solve() do
		@input 
		|> tokenize 
		|> find_crossover 
		|> find_shortest 
		|> print_shortest
	end

	def tokenize(data) do
		String.split(data, ", ") 
		|> Enum.map(fn str -> String.split_at(str, 1) end)
		|> Enum.map(fn {direction, distance} -> {String.to_existing_atom(direction), String.to_integer(distance)} end)
	end

	def find_crossover(tokenized_input) do
		find_crossover tokenized_input, :north, [{0,0}]
	end
	def find_crossover([], _, _) do
		raise "No Crossover found"
	end
	def find_crossover([{turn, dist} | tail], dir, trail) do
		new_dir = rotate dir, turn
		case search trail, new_dir, dist do
			{:nomatch, new_trail} -> find_crossover tail, new_dir, new_trail
			{:found_crossover, crossover} -> crossover
		end
	end

	def find_shortest({x,y}) do
		abs(x) + abs(y)
	end

	def print_shortest(shortest) do
		IO.puts "The shortest route is #{shortest} blocks long."
	end

	def rotate(:north, :L), do: :west
	def rotate(:north, :R), do: :east
	def rotate(:east, :L), do: :north
	def rotate(:east, :R), do: :south
	def rotate(:south, :L), do: :east
	def rotate(:south, :R), do: :west
	def rotate(:west, :L), do: :south
	def rotate(:west, :R), do: :north

	def search(trail, _, 0), do: {:nomatch, trail}
	def search([head|tail], direction, distance) do
		new_position = move head, direction
		if new_position in tail do
			{:found_crossover, new_position}
		else
			search [new_position, head | tail], direction, distance - 1
		end
	end

	def move({x,y}, :north), do: {x, y + 1}
	def move({x,y}, :east), do: {x + 1, y}
	def move({x,y}, :south), do: {x, y - 1}
	def move({x,y}, :west), do: {x - 1, y}
end
