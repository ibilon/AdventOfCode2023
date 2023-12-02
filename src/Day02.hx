var data = {
	var games = [];

	for (game in File.getContent('data/day02.txt').split('\n')) {
		var game = game.split(': ');
		var id = parseInt(game[0].substring(5));
		var cubes = [];

		for (cube in game[1].replace('; ', ', ').split(', ')) {
			var cube = cube.split(' ');
			var amount = parseInt(cube[0]);
			var color = cube[1];

			cubes.push({ amount: amount, color: color });
		}

		games.push({ id: id, cubes: cubes });
	}

	games;
};

function main():Void {
	println('== Day 02 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int {
	var sum = 0;

	for (game in data) {
		var possible = true;

		for (cube in game.cubes) {
			possible = possible && switch (cube.color) {
				case 'red':
					cube.amount <= 12;

				case 'green':
					cube.amount <= 13;

				case 'blue':
					cube.amount <= 14;

				case other:
					throw 'Unknown cube color "${other}"';
			};
		}

		if (possible) {
			sum += game.id;
		}
	}

	return sum;
}

function part2():Int {
	var sum = 0;

	for (game in data) {
		var red = 0;
		var green = 0;
		var blue = 0;

		for (cube in game.cubes) {
			switch (cube.color) {
				case 'red':
					red = imax(red, cube.amount);

				case 'green':
					green = imax(green, cube.amount);

				case 'blue':
					blue = imax(blue, cube.amount);

				case other:
					throw 'Unknown cube color "${other}"';
			}
		}

		sum += red * green * blue;
	}

	return sum;
}
