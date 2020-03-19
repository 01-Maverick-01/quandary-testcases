mutable Q main(mutable int arg) {
    mutable Q x = nil;
    while (arg > 0) {
        x = x . x;
    }
    return 0;
}
