function main():Void {
	println('== Day 07 ==\n');

	println('Part 1: ${winnings(false)}');
	println('Part 2: ${winnings(true)}');
}

function winnings(withJocker:Bool):Int {
	var hands = File.getContent('data/day07.txt').split('\n').map(hand -> hand.split(' '));
	hands.sort(compareHands.bind(withJocker));

	var total = 0;

	for (i => hand in hands) {
		total += (i + 1) * parseInt(hand[1]);
	}

	return total;
}

function compareHands(withJocker:Bool, a:Array<String>, b:Array<String>):Int {
	var valueA = handValue(a[0], withJocker);
	var valueB = handValue(b[0], withJocker);

	if (valueA < valueB) {
		return -1;
	}

	if (valueA > valueB) {
		return 1;
	}

	for (i in 0...5) {
		var valueA = cardValue(a[0].charAt(i), withJocker);
		var valueB = cardValue(b[0].charAt(i), withJocker);

		if (valueA < valueB) {
			return -1;
		}

		if (valueA > valueB) {
			return 1;
		}
	}

	return 0;
}

function handValue(hand:String, withJocker:Bool):Int {
	var cards = new Map<String, Int>();

	for (card in hand.split('')) {
		if (!cards.exists(card)) {
			cards[card] = 1;
		} else {
			cards[card] += 1;
		}
	}

	if (withJocker && cards.exists('J')) {
		cards.remove('J');
	}

	var amounts = Lambda.array(cards);
	amounts.sort(Reflect.compare);

	return switch (amounts) {
		case [], [1], [2], [3], [4], [5]:
			7;

		case [1, 1], [1, 2], [1, 3], [1, 4]:
			6;

		case [2, 2], [2, 3]:
			5;

		case [1, 1, 1], [1, 1, 2], [1, 1, 3]:
			4;

		case [1, 2, 2]:
			3;

		case [1, 1, 1, 1], [1, 1, 1, 2]:
			2;

		default:
			1;
	};
}

function cardValue(card:String, withJocker:Bool):Int {
	return switch (card) {
		case 'A':
			14;

		case 'K':
			13;

		case 'Q':
			12;

		case 'J':
			withJocker ? 1 : 11;

		case 'T':
			10;

		default:
			parseInt(card);
	};
}
