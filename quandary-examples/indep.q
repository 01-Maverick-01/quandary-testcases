mutable Q main(int arg) {
    Cell counters = 0 . 0;
    Q dummy = [ incLeft(counters, arg) . incRight(counters, arg) ];
    return counters;
}
mutable Q incLeft(Cell counters, mutable int n) {
    while (n > 0) {
        int value = (int)left(counters);
        Q dummy = setLeft(counters, value + 1);
        n = n - 1;
    }
    return nil;
}
mutable Q incRight(Cell counters, mutable int n) {
    while (n > 0) {
        int value = (int)right(counters);
        Q dummy = setRight(counters, value + 1);
        n = n - 1;
    }
    return nil;
}
