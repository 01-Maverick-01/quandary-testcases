mutable Q main(int arg) {
    Cell list = (8980 . (3692 . (8513 . (1301 . (2978 . (8724 . (5612 . (8882 . (317 . (5278 . (655 . (6535 . (603 . (2766 . (907 . (1974 . (899 . (2318 . (8129 . (8865 . (7059 . (8364 . (6569 . (6208 . (1211 . (7817 . (1788 . (463 . (2000 . (2427 . (9642 . (6044 . (2922 . (5147 . (8581 . (6029 . (1877 . (5160 . (6932 . (2408 . (8020 . (1475 . (8993 . (6282 . (713 . (8865 . (6716 . (8033 . (4479 . (2300 . (2469 . (7570 . (1361 . (3586 . (645 . (1731 . (5951 . (4372 . (6918 . (6610 . (5744 . (3833 . (5671 . (9436 . (9403 . (2552 . (6105 . (8199 . (5901 . (3041 . (1268 . (3913 . (4678 . (9829 . (9299 . (2686 . (8987 . (4185 . (9603 . (4038 . (6822 . (5848 . (7385 . (5092 . (9969 . (2670 . (2361 . (9504 . (9807 . (8157 . (6047 . (4022 . (4036 . (892 . (1018 . (2741 . (5847 . (9459 . (5164 . (9025 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    Q dummy = [ sort(list) . sort(list) ];
    return isSorted(list) . list;
}

mutable Q sort(Cell list) {
    mutable Q tmp1 = list;
    int len = length(list);
    mutable int pos1 = 0;
    while (isNil(tmp1) == 0) {
        mutable Q tmp2 = list;
        mutable int pos2 = 0;
        while (pos2 < pos1) {
            Q dummy3 = acq((Cell)tmp1);
            Q dummy4 = acq((Cell)tmp2);
            if ((int)left((Cell)tmp2) > (int)left((Cell)tmp1)) {
                int value = (int)left((Cell)tmp1);
                Q dummy1 = setLeft((Cell)tmp1, left((Cell)tmp2));
                Q dummy2 = setLeft((Cell)tmp2, value);
            }
            Q dummy5 = rel((Cell)tmp2);
            Q dummy6 = rel((Cell)tmp1);
            tmp2 = right((Cell)tmp2);
            pos2 = pos2 + 1;
        }
        tmp1 = right((Cell)tmp1);
        pos1 = pos1 + 1;
    }
    return pos1;
}

Q concat(Q first, Q second) {
    if (isNil(first) != 0)
        return second;
    if (isNil(right((Cell)first)) != 0)
        return left((Cell)first) . second;
    return left((Cell)first) . concat(right((Cell)first), second);
}

int isSorted(Q list) {
    if (isNil(list) != 0 || isNil(right((Cell)list)) != 0)
        return 1;
    if ((int)left((Cell)list) > (int)left((Cell)right((Cell)list)))
        return 0;
    return isSorted(right((Cell)list));
}

int length(Q list) {
    if (isNil(list) != 0) return 0;
    return 1 + length(right((Cell)list));
}

Q randomList(int n) {
    if (n == 0) return nil;
    return randomInt(10000) . randomList(n - 1);
}
