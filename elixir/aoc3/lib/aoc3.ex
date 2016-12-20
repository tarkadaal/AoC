defmodule Aoc3 do
	@input_path "./aoc3_input.txt"

	def solve_part_1(), do:	solve &tokenize_horizontal/1
	def solve_part_2(), do:	solve &tokenize_vertical/1
	defp solve(tokenizer) do
		@input_path 
		|> load_input
		|> tokenizer.()
		|> Enum.filter(&is_triangle_valid/1)
		|> length
	end

	def load_input(path) do
		File.read!(path)
	end

	def tokenize_horizontal(input), do:	tokenize input, fn(x) -> for n <- x, do: String.split n end
	def tokenize_vertical(input), do: tokenize input, &rearrange_vertical_triangles/1
	defp tokenize(input, strategy) do
		input
		|> String.trim_trailing
		|> String.split("\n")
		|> strategy.()
		|> Enum.map(fn(x) -> Enum.map(x, &String.to_integer/1) end)
	end

	def rearrange_vertical_triangles(sides) do
		rearrange_vertical_triangles(sides, [], [], [])
	end
	defp rearrange_vertical_triangles([],first, second, third) do
		third ++ second ++ first
		|> Enum.reverse
		|> Enum.chunk(3)
	end
	defp rearrange_vertical_triangles([s | sides], first, second, third) do
		[a,b,c] = String.split(s)
		rearrange_vertical_triangles(sides, [a | first], [b | second], [c | third])
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
