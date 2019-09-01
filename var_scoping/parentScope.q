Q main(int arg) {
   int parentScope = arg;
   mutable int count = parentScope;
   mutable int result = 0;
   while (count > 0) {
       int b = 5;
       result = result + parentScope;
       count = count - 1;
   }
   return result;
}
