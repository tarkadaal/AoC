defmodule Aoc3 do
	@input_path "./aoc3_input.txt"

	def solve_part_1() do
		@input_path 
		|> load_input
		|> tokenize_horizontal
		|> Enum.filter(&is_triangle_valid/1)
		|> length
	end

	def solve_part_2() do
		@input_path 
		|> load_input
		|> tokenize_vertical
		|> Enum.filter(&is_triangle_valid/1)
		|> length
	end

	def load_input(path) do
		File.read!(path)
	end

	def tokenize_horizontal(input) do
		input
		|> String.trim_trailing
		|> String.split("\n")
		|> Enum.map(&String.split/1)
		|> Enum.map(fn(x) -> Enum.map(x, &String.to_integer/1) end)
	end

	def tokenize_vertical(input) do
		input
		|> String.trim_trailing
		|> String.split("\n")
		|> arrange_by_triangle
		|> Enum.map(&String.to_integer/1)
		|> Enum.chunk(3)
	end

	def arrange_by_triangle(sides) do
		arrange_by_triangle(sides, [], [], [])
	end
	defp arrange_by_triangle([],first, second, third) do
		final = third ++ second ++ first
		final |> Enum.reverse
	end
	defp arrange_by_triangle([s | sides], first, second, third) do
		[a,b,c] = String.split(s)
		arrange_by_triangle(sides, [a | first], [b | second], [c | third])
	end

	def is_triangle_valid([a,b,c]) do
		is_side_valid(a, [b,c])
		and is_side_valid(b, [a,c])
		and is_side_valid(c, [a,b])
	end

	defp is_side_valid(side, others) do
		Enum.sum(others) > side
	end
end
