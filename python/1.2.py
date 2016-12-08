import string
import collections
input = "R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1"
split_input = input.split(', ')
x = 0
y = 0
trail = [(0,0)] # list of x,y tuples
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


def add_trail(new_x,new_y):
	trail_head = trail[-1]
	trail_x = trail_head[0]
	trail_y = trail_head[1]
	if new_x == trail_x:
		add_trail_core(trail_y, new_y, lambda n: (trail_x, n))
	else:
		add_trail_core(trail_x, new_x, lambda n: (n, trail_y))

def add_trail_core(old_change, new_change, build_tuple):
	diff = new_change - old_change
	step = 1
	if diff < 0:
		step = -step
	for n in range(old_change + step, old_change + step + diff, step): # +steps are to fix off by one error
		point = build_tuple(n)
		trail.append(build_tuple(n))

def find_crossing():
	return find_crossing_core(trail[0], trail[1:])
def find_crossing_core(search, trail):
	for t in trail:
		if search == t:
			return search
	return find_crossing_core(trail[0], trail[1:])

for item in split_input:
	d = item[0:1]
	b = item[1:]
	if d == 'R':
		directions.rotate(-1)
	else:
		directions.rotate(1)
	directions[0][1](int(b))
	add_trail(x,y)

crossing = find_crossing()
print('Crossover is at ' +str(crossing[0]) + ', ' + str(crossing[1]))
distance = abs(crossing[0]) + abs(crossing[1])
print('Crossover is ' + str(distance) + ' blocks away' )
