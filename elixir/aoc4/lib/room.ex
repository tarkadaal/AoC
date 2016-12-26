defmodule Room do
	defstruct name: nil, sector: nil, checksum: nil

	# input looks like: "aaaaa-bbb-z-y-x-123[abxyz]" 
	def create_from(str) do
		[_, checksum, sector | rest] = String.split(str, ["-", "[", "]"]) |> Enum.reverse 
		name = rest |> Enum.reverse |> Enum.join("-")
		%Room{name: name, sector: String.to_integer(sector), checksum: checksum}
	end
end