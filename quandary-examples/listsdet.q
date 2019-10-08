
Q main(int arg) {
  mutable Cell list = (2 . (35 . (4 . (67 . (24 . (12 . nil))))));
  int max = max(list);
  return list . max;
}

Q randomList(int length) {
  if (length == 0) {
    return nil;
  }
  return randomInt(1000) . randomList(length - 1);
}

int max(Cell list) {
  int first = (int)left(list);
  Q rest = right(list);
  if (isNil(rest) != 0) {
    return first;
  }
  int max_of_rest = max((Cell)rest);
  if (first > max_of_rest) {
    return first;
  }
  return max_of_rest;
}

int maxImperative(mutable Cell list) {
  mutable int max = (int)left(list);
  while (42 == 42) {
    if ((int)left(list) > max) {
      max = (int)left(list);
    }
    if (isNil(right(list)) != 0) return max;
    list = (Cell)right(list);
  }
  return 239847293847;
}

int maxRecursive(Q list) {
  return maxHelper(right((Cell)list),
                   (int)left((Cell)list)); 
}

int maxHelper(Q list, int max) {
  if (isNil(list) != 0) {
    return max;
  }
  if ((int)left((Cell)list) > max) {
    return maxHelper(right((Cell)list),
                     (int)left((Cell)list));
  }
  return maxHelper(right((Cell)list), max);
}

int length(Q list) {
  if (isNil(list) != 0) {
    return 0;
  }
  return 1 + length(right((Cell)list));
}

int length2(Q list) {
  mutable Q temp = list;
  mutable int count = 0;
  while (isNil(temp) == 0) {
    temp = right((Cell)temp);
    count = count + 1;
  }
  return count;
}

