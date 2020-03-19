Q main(int arg) {
    Q list = (126 . (72 . (55 . (159 . (127 . (129 . (140 . (128 . (15 . (28 . (78 . (43 . (10 . (88 . (41 . (159 . (4 . (88 . (140 . (51 . (1 . (108 . (92 . (127 . (62 . (86 . (0 . (9 . (93 . (190 . (142 . (74 . (46 . (127 . (69 . (46 . (72 . (119 . (41 . (112 . (148 . (35 . (35 . (163 . (171 . (160 . (62 . (106 . (11 . (107 . (179 . (81 . (174 . (99 . (134 . (1 . (10 . (73 . (86 . (96 . (90 . (143 . (161 . (95 . (91 . (94 . (142 . (170 . (152 . (22 . (57 . (116 . (39 . (98 . (66 . (64 . (122 . (185 . (166 . (65 . (55 . (95 . (141 . (163 . (8 . (153 . (122 . (15 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    return sort(list);
}

Q sort(Q list) {
    if (isNil(list) != 0 || isNil(right((Cell)list)) != 0) return list;
    int pivot = (int)left((Cell)list);
    Cell lists = [ sort(subList(list, pivot, -1)) . sort(subList(list, pivot, 1)) ];
    return concat(left(lists), concat(subList(list, pivot, 0), right(lists)));
}

Q subList(Q list, int pivot, int comparator) {
    if (isNil(list) != 0)
        return nil;
    int first = (int)left((Cell)list);
    Q rest = right((Cell)list);
    if ((comparator <  0 && first <  pivot) ||
        (comparator == 0 && first == pivot) ||
        (comparator >  0 && first >  pivot))
        return first . subList(rest, pivot, comparator);
    return subList(rest, pivot, comparator);
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
    return randomInt(200) . randomList(n - 1);
}
