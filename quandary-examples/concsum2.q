mutable Q main(mutable int arg) {
  Cell data = 2 . (3 . (5 . (8 . nil)));
  Q dummy1 = setRight((Cell)right((Cell)right((Cell)right(data))), data);
  mutable int visitWay = 1;
  mutable int sum = 0;
  while (arg > 0) {
    sum = sum + [ uniqueSum(data, visitWay) + uniqueSum(data, visitWay) ];
    visitWay = -visitWay;
    arg = arg - 1;
  }
  return sum;
}

mutable int uniqueSum(mutable Cell c, int visitWay) {
  mutable int sum = 0;
  while (1 == 1) {
    Q dummy1 = acq(c);
    int val = (int)left(c);
    if ((val < 0 && visitWay < 0) ||
        (val > 0 && visitWay > 0)) {
      sum = sum + val * visitWay;
      Q dummy2 = setLeft(c, -val);
      Q dummy3 = rel(c);
    } else {
      Q dummy4 = rel(c);
      return sum;
    }
    c = (Cell)right(c);
  }
  return -1;
}
