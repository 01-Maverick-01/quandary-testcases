int fib(int arg) {
  if (arg < 2)
    return arg;
  return fib(arg - 1) + fib(arg - 2);
}

Q main(int arg) {
  return (fib(arg));
}
