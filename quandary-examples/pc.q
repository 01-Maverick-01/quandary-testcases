mutable Q main(int arg) {
    Cell flagAndData = 0 . (0 . 0);
    return [ produce(flagAndData) . consume(flagAndData) ] ;
}

mutable Q produce(Cell flagAndData) {
    int dummy1 = setRight(flagAndData, (42 . 42 * 42));
    int dummy2 = setLeft(flagAndData, 1);
    return nil;
}

Q consume(Cell flagAndData) {
    if ((int)left(flagAndData) != 0) {
        return right(flagAndData);
    }
    return nil;
}
