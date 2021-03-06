mutable Q main(int arg) {
    Cell flagAndData = 0 . 0;
    return [ produce(flagAndData) . consume(flagAndData) ];
}

mutable Q produce(Cell flagAndData) {
    int dummy1 = setRight(flagAndData, 42);
    int dummy2 = acq(flagAndData);
    int dummy3 = setLeft(flagAndData, 1);
    int dummy4 = rel(flagAndData);
    mutable int done = 1;
    while (done == 1) {
        int dummy5 = acq(flagAndData);
        done = (int)left(flagAndData);
        int dummy6 = rel(flagAndData);
    }
    return nil;
}

mutable Q consume(Cell flagAndData) {
    mutable int done = 0;
    mutable int retVal = 0;
    int dummy1 = acq(flagAndData);
    if ((int)left(flagAndData) != 0) {
        retVal = (int)right(flagAndData);
    }
    int dummy2 = rel(flagAndData);
    int dummy3 = acq(flagAndData);
    int dummy4 = setLeft(flagAndData, 2);
    int dummy5 = rel(flagAndData);
    return retVal;
}
