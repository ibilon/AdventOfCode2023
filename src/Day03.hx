function main():Void {
	println('== Day 03 ==\n');

	var data = File.getContent('data/day03.txt').split('\n').map(line -> line.split(''));

	var partNumberSum = 0;
	var gearRatioSum = 0;
	var gears = new Map<String, Array<Int>>();

	for (y => line in data) {
		var x = -1;

		while (++x < line.length) {
			var partNumber = 0;
			var isPart = false;
			var gear = null;

			while (x < line.length) {
				var char = line[x].charCodeAt(0) - '0'.code;

				if (char < 0 || char > 9) {
					break;
				}

				for (yy in -1...2) {
					if (y + yy < 0 || y + yy >= data.length) {
						continue;
					}

					for (xx in -1...2) {
						if (x + xx < 0 || x + xx >= data[0].length) {
							continue;
						}

						var char2 = data[y + yy][x + xx].charCodeAt(0);
						isPart = isPart || ((char2 < '0'.code || char2 > '9'.code) && char2 != '.'.code);

						if (data[y + yy][x + xx] == '*') {
							gear = '${y + yy} ${x + xx}';
						}
					}
				}

				partNumber = partNumber * 10 + char;
				x += 1;
			}

			if (partNumber != 0 && isPart) {
				partNumberSum += partNumber;

				if (gear != null) {
					if (!gears.exists(gear)) {
						gears[gear] = [partNumber];
					} else {
						gears[gear].push(partNumber);
					}
				}
			}
		}
	}

	for (gear in gears) {
		if (gear.length != 2) {
			continue;
		}

		gearRatioSum += gear[0] * gear[1];
	}

	println('Part 1: ${partNumberSum}');
	println('Part 2: ${gearRatioSum}');
}
