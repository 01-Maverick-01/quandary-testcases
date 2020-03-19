mutable Q main (mutable int arg) {
	mutable Q list = randomList(arg + 42);
	while (arg > 1) {
        Q dummy = [ rmRandomEarlyElement(list) . rmRandomEarlyElement(list) ];
		arg = arg - 2;
	}
	return length(list);
}

mutable Q rmRandomEarlyElement(Q list) {
	int index = randomInt(2);
    Q dummy1 = acq((Cell)list);
	Q dummy2 = rmElement(list, index);
    Q dummy3 = rel((Cell)list);
    return nil;
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
    if (index == 0) {
        Q dummy1 = setLeft((Cell)list, left((Cell)right((Cell)list)));
        Q dummy2 = setRight((Cell)list, right((Cell)right((Cell)list)));
    } else if (index == 1) {
        Q dummy3 = setRight((Cell)list, right((Cell)right((Cell)list)));
    } else {
        Q dummy4 = rmElement(right((Cell)list), index - 1);
    }
    return nil;
}
