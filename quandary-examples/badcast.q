
Q foo(Q asdf, Cell hjkl) {
  return (left(hjkl) . asdf);
}

Q main(int arg) {
  int a = (int)foo((nil . 8), (arg . nil));
  return a;
}
