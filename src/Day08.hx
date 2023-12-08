var data = {
	var data = File.getContent('data/day08.txt').split('\n\n');

	var instructions = data[0].split('');
	var network = new Map<String, Array<String>>();

	for (node in data[1].split('\n')) {
		var node = node.split(' = (');
		network[node[0]] = node[1].substr(0, node[1].length - 1).split(', ');
	}

	{ instructions: instructions, network: network };
};

function main():Void {
	println('== Day 08 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int {
	return runPath('AAA');
}

function part2():Int64 {
	var paths = new Array<Int>();

	for (node in data.network.keys()) {
		if (node.endsWith('A')) {
			paths.push(runPath(node));
		}
	}

	var result:Int64 = paths[0];

	for (i in 1...paths.length) {
		result = lcm(result, paths[i]);
	}

	return result;
}

function runPath(start:String):Int {
	var current = start;
	var steps = 0;

	while (!current.endsWith('Z')) {
		var side = data.instructions[steps % data.instructions.length] == 'L' ? 0 : 1;
		current = data.network[current][side];
		steps += 1;
	}

	return steps;
}

function lcm(a:Int64, b:Int64):Int64 {
	return (a * b) / hcf(a, b);
}

function hcf(a:Int64, b:Int64):Int64 {
	var x = a > b ? a : b;
	var y = a < b ? a : b;

	while (true) {
		var r = x % y;

		if (r == 0) {
			break;
		}

		x = y;
		y = r;
	}

	return y;
}
