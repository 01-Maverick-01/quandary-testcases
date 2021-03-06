int plus() { return 1; }
int times() { return 2; }

mutable int main(int arg) {
    Q expr = (times() . ((plus() . (5 . 7)) .
                         (plus() . (14 .
                                    (times() . (17 . 18))
             )          ))         );
    return mycalc(expr);
}

int mycalc(Q expr) {
    if (isAtom(expr) != 0) {
        return (int)expr;
    }
    Cell e = (Cell)expr;
    mutable int op = (int)left(e);
    mutable Q left = left((Cell)right(e));
    Q right = right((Cell)right(e));
    if (op == plus()) {
        return mycalc(left) + mycalc(right);
    }
    if (op == times()) {
        return mycalc(left) * mycalc(right);
    }
    return 42;
}
