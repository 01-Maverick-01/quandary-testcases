
Q foo(Q asdf, Cell hjkl) {
  int x = 5;
  Cell z = (hjkl . asdf);
  return left((Cell)left(z));
}

Q main(int arg) {
  int a = (int)foo(nil, (arg . nil));
  int b = 8 + a * 7;
  if (18 < (int)a + b) {
    Q c = b;
    return c;
  }
  return nil;
}
