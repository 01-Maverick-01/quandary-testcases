mutable Q main(int arg) {
	if (arg == 0) {
	    return nil;
	  }
	mutable Cell list = orderedList(arg);
	list = flip(list);
	Cell a = orderedList(arg);
	return list;
}

Cell orderedList(int length) {
	if (length == 1)
		return 1.nil;
	return length . orderedList(length - 1);
}

mutable Cell flip(Cell list) {
	Cell ret = right(list) . left(list);
	if (isAtom(left(ret)) == 0)
		int i = setLeft(ret, flip((Cell)left(ret)));
	if (isAtom(right(ret)) == 0)
		int j = setRight(ret, flip((Cell)right(ret)));
	return ret;
}