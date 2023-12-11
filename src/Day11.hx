function main():Void {
	println('== Day 11 ==\n');

	var data = File.getContent('data/day11.txt').split('\n').map(line -> line.split(''));

	var columns = new Array<Int>();
	var rows = new Array<Int>();

	for (x in 0...data[0].length) {
		if (!exists(data, line -> line[x] == '#')) {
			columns.push(x);
		}
	}

	for (y in 0...data.length) {
		if (!exists(data[y], value -> value == '#')) {
			rows.push(y);
		}
	}

	var galaxies = new Array<Pair<Int, Int>>();

	for (y in 0...data.length) {
		for (x in 0...data[0].length) {
			if (data[y][x] == '#') {
				galaxies.push(new Pair(x, y));
			}
		}
	}

	var part1 = 0;
	var part2:Int64 = 0;

	for (i in 0...galaxies.length) {
		for (j in i + 1...galaxies.length) {
			var a = galaxies[i];
			var b = galaxies[j];

			var startX = imin(a.first, b.first);
			var endX = imax(a.first, b.first);
			var extraX = count(columns, column -> column > startX && column < endX);

			var startY = imin(a.second, b.second);
			var endY = imax(a.second, b.second);
			var extraY = count(rows, row -> row > startY && row < endY);

			var path = iabs(b.first - a.first) + iabs(b.second - a.second);

			part1 += path + extraX + extraY;
			part2 += path + (extraX + extraY) * (1000000 - 1);
		}
	}

	println('Part 1: ${part1}');
	println('Part 2: ${part2}');
}
