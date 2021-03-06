defmodule Aoc3 do
	@input_path "./aoc3_input.txt"

	def solve_part_1(), do:	solve &tokenize_horizontal/1
	def solve_part_2(), do:	solve &tokenize_vertical/1
	defp solve(tokenizer) do
		@input_path 
		|> File.read!
		|> tokenizer.()
		|> Enum.filter(&valid_triangle?/1)
		|> length
	end

	def tokenize_horizontal(input), do: tokenize input, fn(x) ->  x end
	def tokenize_vertical(input), do: tokenize input, &rearrange/1
	defp tokenize(input, strategy) do
		input
		|> String.trim_trailing
		|> String.split
		|> strategy.()
		|> Enum.map(&String.to_integer/1) 
		|> Enum.chunk(3)
	end

	def rearrange(sides) do
		a = sides |> Enum.take_every(3)
		b = sides |> Enum.drop(1) |> Enum.take_every(3)
		c = sides |> Enum.drop(2) |> Enum.take_every(3)
		a ++ b ++ c 
	end

	def valid_triangle?([a,b,c]), do: valid_side?(a, [b,c]) and valid_side?(b, [a,c]) and valid_side?(c, [a,b])
	defp valid_side?(side, others), do: Enum.sum(others) > side
	
end
