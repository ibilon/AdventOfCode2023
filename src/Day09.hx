var data = File.getContent('data/day09.txt').split('\n').map(line -> {
	var line = line.split(' ').map(parseInt);
	var history = [line];
	var last = line;

	while (true) {
		var allZero = true;
		var next = new Array<Int>();

		for (i in 1...last.length) {
			var value = last[i] - last[i - 1];
			allZero = allZero && value == 0;
			next.push(value);
		}

		history.push(next);
		last = next;

		if (allZero) {
			break;
		}
	}

	history.reverse();
	history;
});

function main():Void {
	println('== Day 09 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int {
	var sum = 0;

	for (history in data) {
		for (line in history) {
			sum += line[line.length - 1];
		}
	}

	return sum;
}

function part2():Int {
	var sum = 0;

	for (history in data) {
		var added = 0;

		for (line in history) {
			added = line[0] - added;
		}

		sum += added;
	}

	return sum;
}
