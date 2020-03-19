mutable Q main(int arg) {
  Cell data = ((2 . nil) . ((8 . nil) . 7));
  Q dummy = setRight((Cell)left(data), right(data));
  return sum(data);
}

int sum(Q data) {
  if (isNil(data) != 0) {
    return 0;
  }
  if (isAtom(data) != 0) {
    return (int)data;
  }
  return sum(left((Cell)data)) + sum(right((Cell)data));
}

