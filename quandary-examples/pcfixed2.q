mutable Q main(int arg) {
    Cell flagAndData = 0 . (0 . 0);
    mutable int count = 0;
    while (1 == 1) {
      Q result = right([ produce(flagAndData) . consume(flagAndData) ]);
      if (isNil(result) == 0) {
        return result;
      }
      count = count + 1;
    }
    return nil;
}

mutable Q produce(Cell flagAndData) {
    int dummy1 = setRight(flagAndData, 42 . 42);
    int dummy3 = acq(flagAndData);
    int dummy2 = setLeft(flagAndData, 1);
    int dummy4 = rel(flagAndData);
    return nil;
}

mutable Q consume(Cell flagAndData) {
    int dummy1 = acq(flagAndData);
    int flag = (int)left(flagAndData);
    int dummy2 = rel(flagAndData);
    if (flag != 0) {
        return right(flagAndData);
    }
    return nil;
}
