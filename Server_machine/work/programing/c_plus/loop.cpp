#include <iostream>
using namespace std;

// main() is where program execution begins.

int main() {
   int n = 100;
   int array[100][100];
   
   for (int k = 0;k < (n +1)/2 ; k++){
        for (int i = k; i < n-k; i++){
            array[k][i] = k;
            array[n-k-1][i] = k;   
            
            array[i][k] = k;   
            array[i][n-k-1] = k;   
        }
        

    }
        for (int i = 0; i < n; i++){
            
        for (int j = 0; j < n; j++){
            cout << array[i][j] <<" ";
            }
            cout << endl;
        }
   
   return 0;
}
