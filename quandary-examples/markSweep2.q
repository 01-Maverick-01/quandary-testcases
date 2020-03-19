Q main(mutable int arg) {
   mutable Cell result = 5.5;
   Cell result2 = result.(result.arg);
   return result2;
}

