mutable Q main(int arg) {
  mutable Q list = 2 . nil;
  list = addR(list, 3);
  list = addR(list, 5);
  return list;
}

Cell addR(Q list, int elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  Q left = left((Cell)list);
  Q right = right((Cell)list);
  int wasFreed = free((Cell)list);
  return left . addR(right, elem);
}
