mutable Q main(mutable int arg) {
    while (arg > 0) {
        Cell last = 7 . nil;
        Cell x = 2 . (3 . (5 . last));
        int dummy = setRight(last, x);
        arg = arg - 1;
    }
    return 0;
}
