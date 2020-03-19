mutable Q main(mutable int arg) {
  Cell data = ((2 . nil) . ((8 . nil) . 7));
  Q dummy = setRight((Cell)left(data), right(data));
  mutable int visitWay = 1;
  mutable int sum = 0;
  while (arg > 0) {
    sum = sum + [ uniqueSum(data, visitWay) + uniqueSum(data, visitWay) ];
    visitWay = -visitWay;
    arg = arg - 1;
  }
  return sum;
}

mutable int uniqueSum(Q data, int visitWay) {
  if (isNil(data) != 0) {
    return 0;
  }
  if (isAtom(data) != 0) {
    return (int)data;
  }
  Cell c = (Cell)data;
  Q dummy1 = acq(c);
  mutable int sum = 0;
  if (isAtom(left(c)) != 0 && isNil(left(c)) == 0) {
    int l = (int)left(c);
    if ((l < 0 && visitWay < 0) ||
        (l > 0 && visitWay > 0)) {
      sum = sum + l * visitWay;
      Q dummy3 = setLeft(c, -l);
    }
  } else {
    sum = sum + uniqueSum(left(c), visitWay);
  }
  if (isAtom(right(c)) != 0 && isNil(right(c)) == 0) {
    int r = (int)right(c);
    if ((r < 0 && visitWay < 0) ||
        (r > 0 && visitWay > 0)) {
      sum = sum + r * visitWay;
      Q dummy4 = setRight(c, -r);
    }
  } else {
    sum = sum + uniqueSum(right(c), visitWay);
  }
  Q dummy2 = rel(c);
  return sum;
}
