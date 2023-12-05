var data = File.getContent('data/day05.txt').split('\n\n');
var seeds = data.shift().split(': ')[1].split(' ').map(Int64.parseString);
var maps = data.map(parseMap);

function main():Void {
	println('== Day 05 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int64 {
	var location:Int64 = INT_MAX;

	for (seed in seeds) {
		var seed = seedLocation(seed);
		location = seed < location ? seed : location;
	}

	return location;
}

function part2():Int64 {
#if !cpp
	println('/!\\ Target C++ to brute force part 2 (takes ~5min) /!\\');
	Sys.exit(1);
	return 0;
#else
	var location:Int64 = INT_MAX;

	var i = 0;
	while (i < seeds.length) {
		var seed = seeds[i];

		var j:Int64 = -1;
		while (++j < seeds[i + 1]) {
			var seed = seedLocation(seed + j);
			location = seed < location ? seed : location;
		}

		i += 2;
	}

	return location;
#end
}

function parseMap(data:String):Array<Array<Int64>> {
	var map = new Array<Array<Int64>>();

	for (line in data.split(':\n')[1].split('\n')) {
		var line = line.split(' ').map(Int64.parseString);
		map.push(line);
	}

	return map;
}

function seedLocation(seed:Int64):Int64 {
	for (map in maps) {
		for (line in map) {
			if (seed >= line[1] && seed < line[1] + line[2]) {
				seed = line[0] + seed - line[1];
				break;
			}
		}
	}

	return seed;
}
