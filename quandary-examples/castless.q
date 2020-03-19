int foo(int i, Q q, Cell c) {
  int i1 = i;
  int i2 = q;
  int i3 = c;

  Q q1 = i;
  Q q2 = q;
  Q q3 = c;

  Cell c1 = i;
  Cell c2 = q;
  Cell c3 = c;

  return 0;
}

int main(int arg) {
  return foo (arg, arg, arg . arg);
}
