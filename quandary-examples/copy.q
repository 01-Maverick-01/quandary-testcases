mutable Q main(int arg) {
	if (arg == 0) {
	    return nil;
	  }
	Cell original = orderedList(arg);
	Cell copy = copy(original);
	int i = setLeft(copy, 0);
	return original . copy;
}

Cell orderedList(int length) {
	if (length == 1)
		return 1.nil;
	return length . orderedList(length - 1);
}

Cell copy(Cell list) {
	mutable Q leftCopy = left(list);
	if (isAtom(left(list)) == 0)
		leftCopy = copy((Cell)left(list));
	mutable Q rightCopy = right(list);
	if (isAtom(right(list)) == 0)
		rightCopy = copy((Cell)right(list));
	return leftCopy . rightCopy;
}