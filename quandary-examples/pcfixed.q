mutable Q main(int arg) {
    Cell flagAndData = 0 . (0 . 0);
    return [ produce(flagAndData) . consume(flagAndData) ] ;
}

mutable Q produce(Cell flagAndData) {
    int dummy1 = setRight(flagAndData, (42 . 42 * 42));
    int dummy3 = acq(flagAndData);
    int dummy2 = setLeft(flagAndData, 1);
    int dummy4 = rel(flagAndData);
    return nil;
}

mutable Q consume(Cell flagAndData) {
    mutable int done = 0;
    while (done == 0) {
        int dummy1 = acq(flagAndData);
        done = (int)left(flagAndData);
        int dummy2 = rel(flagAndData);
    }
    return right(flagAndData);
}
