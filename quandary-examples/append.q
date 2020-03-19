mutable Q main(int arg) {
  mutable Q list = nil;
  list = add(list, 4);
  list = add(list, 3);
  list = add(list, 5);
  list = add(list, 42);
  return list;
}

mutable Cell add(Q list, Q elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  mutable Cell curr = (Cell)list;
  while (isNil(right(curr)) == 0) {
    curr = (Cell)right(curr);
  }
  Q q = setRight(curr, elem . nil);
  return (Cell)list;
}

Cell addR(Q list, int elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  return left((Cell)list) .
         addR(right((Cell)list), elem);
}
