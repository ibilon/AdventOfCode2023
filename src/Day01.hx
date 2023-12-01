var data = File.getContent('data/day01.txt').split('\n');

function main():Void {
	println('== Day 01 ==\n');

	println('Part 1: ${part1()}');
	println('Part 2: ${part2()}');
}

function part1():Int {
	var sum = 0;

	for (row in data) {
		var digits = row.split('').map(Std.parseInt).filter(value -> value != null);
		sum += digits[0] * 10 + digits[digits.length - 1];
	}

	return sum;
}

function part2():Int {
	var sum = 0;

	for (row in data) {
		var first = null;
		var last = null;

		for (i in 0...row.length) {
			if (first == null) {
				first = find_digit(row, i);
			}

			if (last == null) {
				last = find_digit(row, row.length - 1 - i);
			}
		}

		sum += Std.parseInt(first + last);
	}

	return sum;
}

function find_digit(row:String, i:Int):String {
	var at = row.charAt(i);
	if (Std.parseInt(at) != null) {
		return at;
	}

	var letters = ['one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'];
	for (letter => digit in letters) {
		if (row.substr(i, letter.length) == letter) {
			return digit;
		}
	}

	return null;
}
