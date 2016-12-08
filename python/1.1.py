import string
import collections
input = "R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1"
split_input = input.split(', ')
x = 0
y = 0
def go_north(blocks):
	global y
	y = y + blocks
def go_east(blocks):
	global x
	x = x + blocks
def go_south(blocks):
	global y
	y = y - blocks
def go_west(blocks):
	global x
	x = x - blocks
directions = collections.deque([("north", go_north), ("east", go_east), ("south", go_south), ("west", go_west)])


for item in split_input:
	d = item[0:1]
	b = item[1:]
	if d == 'R':
		directions.rotate(-1)
	else:
		directions.rotate(1)
	print('Going ' + directions[0][0] + ' for ' + b + ' blocks.')
	directions[0][1](int(b))
	print('Now at x:' + str(x) + ' y:' + str(y))

distance = abs(x) + abs(y)
print('HQ is ' + str(distance) + ' blocks away' )
