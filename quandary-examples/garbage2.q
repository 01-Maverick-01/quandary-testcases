mutable Q main(mutable int arg) {
    Cell x = nil . nil;
    while (arg > 0) {
        int dummy1 = setLeft(x, arg . arg);
        int dummy2 = setRight(x, arg . arg);
        arg = arg - 1;
    }
    return 0;
}
