mutable Q main(int arg) {
	if (arg == 0) {
	    return nil;
	  }
	Cell list = orderedList(arg);
	Cell f = flip(list);
	return f;
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
	
		int i = setRight(ret, flip((Cell)right(ret)));
	
	return ret;
}
