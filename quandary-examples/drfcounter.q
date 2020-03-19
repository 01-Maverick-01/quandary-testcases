
mutable int doLeftInc(Cell counters) {
    mutable int i = 0;
    while (i < 10000) {
        int dummy1 = acq(counters);
        int value = (int)left(counters);
        int dummy2 = rel(counters);
        int dummy3 = acq(counters);
        int dummy4 = setLeft(counters, value + 1);
        int dummy5 = rel(counters);
        i = i + 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Cell counters = 0 . 0;
    int dummy = [ doLeftInc(counters) + doLeftInc(counters) ];
    int value = (int)left(counters);
    if (value < 10000 || value >= 20000) return value;
    return nil;
}
