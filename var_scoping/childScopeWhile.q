Q main(int args)
{
  mutable int a = 0; 
  int b = 30; 
  mutable int c = 0; 
  while(a < b) 
  {
    mutable int  wint = 10;  

    if(a<31)
    {
       wint = wint + 1; 
       a = a + 3; 
    } 
    c = wint;   
    a = a - 1;  
  } 
  int d = 0; 
  return a . c . d;  
}
