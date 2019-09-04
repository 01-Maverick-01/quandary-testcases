Q main(int arg) {
   return arg . A(arg);
}

Q A(mutable int arg) {
   arg = arg + 1;  
   return arg . B(arg);
}

int B(mutable int arg) {
   arg = arg + 1; 
   return arg;
}
