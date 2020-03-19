mutable Q main(int arg) {
    Cell list = (0 . (1 . (1 . (4 . (8 . (9 . (10 . (10 . (11 . (15 . (15 . (22 . (28 . (35 . (35 . (39 . (41 . (41 . (43 . (46 . (46 . (51 . (55 . (55 . (57 . (62 . (62 . (64 . (65 . (66 . (69 . (72 . (72 . (73 . (74 . (78 . (81 . (86 . (86 . (88 . (88 . (90 . (91 . (92 . (93 . (94 . (95 . (95 . (96 . (98 . (99 . (106 . (107 . (108 . (112 . (116 . (119 . (122 . (122 . (126 . (127 . (127 . (127 . (128 . (129 . (134 . (140 . (140 . (141 . (142 . (142 . (143 . (148 . (152 . (153 . (159 . (159 . (160 . (161 . (163 . (163 . (166 . (170 . (171 . (174 . (179 . (185 . (190 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
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
