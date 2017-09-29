#include <iostream>

using namespace std;
// Faire un example
void example();
// deuximère example
void swap(int& x, int& y);
void swap_pointer(int *x, int *y);
void pass_reference();

int main(){
  //Le première example
  example();

  //Le deuximère example
  pass_reference();
  return 0;
}

void swap(int& x, int& y){
  int temp;
  temp = x;
  x = y;
  y = temp;
  return;
}

void swap_pointer(int *x, int *y){
  int temp;
  temp = *x;
  *x = *y;
  *y = temp;

  return;
}

void pass_reference(){
  int a = 100;
  int b = 200;

  cout<<"Value of a and b before swap "<<endl;
  cout<<"Value of a "<<a<<endl;
  cout<<"Value of b "<<b<<endl;

  swap(a,b);

  cout<<"Value of a and b after swap "<<endl;
  cout<<"Value of a "<<a<<endl;
  cout<<"Value of b "<<b<<endl;

  cout<<"_______________________________________________________"<<endl;

  swap_pointer(&a,&b);
  cout<<"Value of a and b after swap "<<endl;
  cout<<"Value of a "<<a<<endl;
  cout<<"Value of b "<<b<<endl;


  return;
}

void example(){
  // declare simple variables
  int i;
  double d;

  // declare reference variables
  int& r = i;
  double& s = d;

  i = 5;
  cout<<"Value of i : " <<i<< endl;
  cout<<"Value of reference : " <<r<< endl;

  //d = 7.1
  cout<<" Value of d: "<<d<<endl;
  cout<<" Value of reference : "<<s<<endl;
}


