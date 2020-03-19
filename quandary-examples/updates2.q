mutable Q main(int arg) {
  Q blah = 5 . nil;
  return helper(blah);
}

mutable Q helper(Q x) {
  mutable Q dummy1 = setLeft((Cell)x, 8);
  int dummy2 = setRight((Cell)x, nil . 9);
  dummy1 = nil;
  return dummy1 . dummy2;
}
