
Q main(int arg) {
    Q list = randomList(arg);
    Q sortedList = sort(list);
    return sortedList;
}

Q randomList(int length) {
    if (length == 0) {
        return nil;
    }
    return randomInt(100000) . randomList(length - 1);
}

Q sort(Q list) {
    if (isNil(list) != 0) return nil;
    return insert((int)left((Cell)list), sort(right((Cell)list)));
}

Q insert(int elem, Q list) {
    if (isNil(list) != 0) {
        return elem . nil;
    }
    if ((int)elem <= (int)left((Cell)list)) {
        return elem . list;
    }
    return left((Cell)list) . insert(elem, right((Cell)list));
}
