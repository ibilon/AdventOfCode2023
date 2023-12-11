class Pair<A, B> {
	public var first:A;
	public var second:B;

	public function new(first:A, second:B) {
		this.first = first;
		this.second = second;
	}

	public function toString():String {
		return '(${first},${second})';
	}
}
