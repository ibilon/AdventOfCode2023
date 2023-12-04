function main():Void {
	println('== Day 04 ==\n');

	var data = File.getContent('data/day04.txt').split('\n');

	var points = 0;
	var total = data.length;
	var copies = [for (_ in data) 1];

	for (i => card in data) {
		var card = card.split(': ')[1].split(' | ');
		var winningNumbers = new Map<String, Bool>();

		for (number in card[0].split(' ').map(n -> n.trim())) {
			if (number != '') {
				winningNumbers.set(number, false);
			}
		}

		var amount = count(card[1].split(' '), number -> winningNumbers.exists(number.trim()));
		points += int(pow(2, amount - 1));

		for (j in 0...amount) {
			copies[i + j + 1] += copies[i];
			total += copies[i];
		}
	}

	println('Part 1: ${points}');
	println('Part 2: ${total}');
}
