
Q main(int arg) {
  Cell list = (Cell)orderedList(arg);
  int max = max(list);
  return (Cell)(list . max);
}

Q orderedList(int length) {
  if (length == 0) {
    return nil;
  }
  return length . orderedList(length - 1);
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
