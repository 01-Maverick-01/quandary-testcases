Q main(int arg) {
    if (arg == 1) {
        return (int)foo(5 . 8);
    } else if (arg == 2) {
        return (int)foo(nil . nil);
    }
    return (Cell)foo(nil . (nil . nil));
}

Q foo(Cell c) {
    return left(c);
}
