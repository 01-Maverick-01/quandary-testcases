int fact(int arg){
   if (arg == 1) return 1;
   return (arg * fact(arg-1));
}

int main(int arg) {
   return fact(arg);
}
