mutable Q main(int arg) {
  Cell c = 2 . 3;
  int result = (int)swapAndGetLeft(c) + (int)left(c);
  return result;
}

mutable Cell swap(Cell c) {
  Q tmp = left(c);
  int blah = setLeft(c, right(c));
  int blah2 = setRight(c, tmp);
  return c;
}

mutable Q swapAndGetLeft(Cell c) {
  Q tmp = left(c);
  int blah1 = setLeft(c, right(c));
  int blah2 = setRight(c, tmp);
  Q result = left(c);
  return result;
}  
