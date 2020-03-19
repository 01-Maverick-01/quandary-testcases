mutable Q main(mutable int arg) {
    mutable Cell x = nil . nil;
    mutable Cell y = nil . nil;
    while (arg > 0) {
        x = nil . nil;
        y = nil . x;
        int dummy = setRight(x, y);
        int dummy1 = free(x);
        int dummy2 = free(y);
        arg = arg - 1;
    }
    return 0;
}
