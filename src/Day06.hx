var data = File.getContent('data/day06.txt').split('\n').map(line -> line.split(':')[1]);

function main():Void {
	println('== Day 06 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int {
	var data = data.map(line -> line.split(' ').map(parseInt).filter(n -> n != null));
	var result = 1;

	for (race in 0...data[0].length) {
		result *= winRace(data[0][race], data[1][race]);
	}

	return result;
}

function part2():Int64 {
	var data = data.map(line -> Int64.parseString(line.replace(' ', '')));
	return winRace(data[0], data[1]);
}

function winRace(time:Int64, distance:Int64):Int {
	var count = 0;
	var hold:Int64 = -1;

	while (++hold <= time) {
		if ((time - hold) * hold > distance) {
			count += 1;
		}
	}

	return count;
}
