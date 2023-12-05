var INT_MAX = 2147483647;

var INT_MIN = -2147483648;

function iabs(a:Int):Int {
	return a < 0 ? -a : a;
}

function imax(a:Int, b:Int):Int {
	return a > b ? a : b;
}

function imin(a:Int, b:Int):Int {
	return a < b ? a : b;
}
