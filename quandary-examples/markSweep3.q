Q main(mutable int arg) {
   Cell result2 = foo((arg.arg), (arg.arg), (arg.arg), (arg.arg));
   Q result = arg.arg;
   Q result3 = result2.result2;
   return result;
}

Cell foo(Cell a, Cell b, Cell c, Cell d) {
   return b.c;
}

