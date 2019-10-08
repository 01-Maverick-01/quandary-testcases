mutable Q main(int arg) {
  mutable Q blah = 5 . nil;
  int dummy1 = setLeft((Cell)blah, 8);
  int dummy2 = setRight((Cell)blah, nil . 9);
  return blah;
}
