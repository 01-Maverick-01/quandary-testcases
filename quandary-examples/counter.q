
mutable int doLeftInc(Cell counters) {
    mutable int i = 0;
    while (i < 10000) {
        int dummy1 = acq(counters);
        int value = (int)left(counters);
        int dummy = setLeft(counters, value + 1);
        int dummy2 = rel(counters);
        i = i + 1;
    }
    return 0;
}

mutable int doRightInc(Cell counters) {
    mutable int i = 0;
    while (i < 10000) {
        int value = (int)right(counters);
        int dummy = setRight(counters, value + 1);
        i = i + 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Cell counters = 0 . 0;
    int dummy = [ doRightInc(counters) + doRightInc(counters) ];
    return counters;
}
