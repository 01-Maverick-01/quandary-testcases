Q main(mutable int arg) {
   mutable Cell result = 5.5;
   while (arg > 0) {
	int res = free(result);
	result = 5.5;
        arg = arg - 1;
   }
   return result;
}
