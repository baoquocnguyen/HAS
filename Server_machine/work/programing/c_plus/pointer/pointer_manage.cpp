#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;

void basic_pointer_function(){

    int var = 20; //actual variable declaration
    int *ip; //this is pointer where we would like to stored value of var

    ip = &var;

    cout<< "Print value of variable: ";
    cout<< &var<<" ## "<<var<<endl;

    cout<< "Address stored in ip variable: ";
    cout<<ip<<endl;

    cout<< "value of var in ip";
    cout<<*ip<<endl;
    cout<<"______________________________________________"<<endl;
    
    //int *ptr; //this is pointer where we would like to stored value of var

    //*ptr = var;

    //cout<< "Address stored in ip variable: ";
    //cout<<ptr<<endl;

    //cout<< "value of var in ip";
    //cout<<*ptr<<endl;
    //cout<<"______________________________________________"<<endl;


}
int null_function(){
    int *ptr = NULL;

    cout<<"The value of ptr is"<<ptr;
    //cout<<"The value of *ptr is"<<*ptr;
    //cout<<"The value of &ptr is"<<&ptr;

    return 0;
}

const int MAX = 3;
int array(){

  int var[MAX] = {10, 100, 1000};
  int *ptr;

  //let us have array address in pointer
  ptr = var;

  for (int i = 0;i < MAX; i++){
  
    cout<<"Address of var["<<i<<"] :";
    cout<<ptr<<endl;


    cout<<"Value of var["<<i<<"] :";
    cout<<*ptr<<endl;
  }
}

void getSeconds(unsigned long * val){

    //val = time( NULL );
    *val = 100;
    return;
}

double getAverage(int *arr, int size){
  int i, sum = 0;
  double avg;

  for (i = 0;i< size;i++){
    sum += arr[i];
  }
  
  return double(sum)/size;
}

int * getRandom(){
  static int r[10];

  // set the seed
  srand( (unsigned)time( NULL) );

  for (int i = 0;i < 10;i++){
    r[i] = rand();
    cout<<r[i]<<endl;
  }

  return r;
}
int main(){

    //Example 1: working on pointer
    //basic_pointer_function();
    
    //cout<<"____________________________________"<<endl;
    //cout<<null_function();
    
    //cout<<"____________________________________"<<endl;
    //cout<<array();
    //cout<<"____________________________________"<<endl;
    //unsigned long sec = 10;

    //cout<<"A original value of sec is : "<<sec<<endl;
    //// chane sec value
    //getSeconds(&sec);
    //cout<<"Value of sec after modifier : "<<sec<<endl;
    //// chane sec value

    //cout<<"____________________________________"<<endl;
    
    //int balance[5] = {40, 10, 20, 30, 50};
    //int *ptr;
    //ptr = balance;
    //double avg;

    //avg = getAverage(ptr, 5);
    //cout<<"avarage value "<<avg<<endl;
    cout<<"____________________________________"<<endl;
    int *ptr;

    ptr = getRandom();

    for (int i = 0;i < 10;i++){
      cout<< "*(ptr +"<<i<<") :";
      cout<<*(ptr+i)<<endl;
    }

    return 0;
}
