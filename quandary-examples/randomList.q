mutable Q main (mutable int arg) {
	if (arg == 0)
		return nil;
	mutable Q list = randomList(arg);
	while (arg > 0) {
		int index = randomInt(arg);
		list = rmElement(list, index);
		list = randomInt(100000) . list;
		arg = arg - 1;
	}
	return length(list);
}

int length(Q list) {
	if (isNil(list) != 0) return 0;
	return 1 + length(right((Cell)list));
}

Q randomList(int length) {
	if (length == 0) {
        return nil;
    }
    return randomInt(100000) . randomList(length - 1);
}

mutable Q rmElement(Q list, int index) {
	if (isNil(list) != 0)
		return nil;
	if (index == 0) {
		return right((Cell)list);
	}
	int dummy = setRight((Cell)list, rmElement(right((Cell)list), index-1));
	return list;
}