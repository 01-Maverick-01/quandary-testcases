Cell main(mutable int arg) {
	mutable Cell a = 1.2;
	while (arg > 0) {
		arg = arg - 1;
		int succ = free(a);
		a = arg . arg+1;
	}
	return a;
}