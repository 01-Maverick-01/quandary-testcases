Q main(int arg) {
   return arg . A(arg);
}

int A(int arg) {
   arg = arg + 1;  
   return arg . B(arg);
}

int B(int arg) {
   arg = arg + 1; 
   return arg;
}
