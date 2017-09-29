package  main

import "fmt"

func main(){
  /* create a slice */
  numbers := []int{0,1,2,3,4,5,6,7,8}
  printSlice(numbers)

  /* print the original slice */
  fmt.Println("numbers ==",numbers)
  
  /* print the sub clice starting from index 1(included) to index 4(excluded)*/
  fmt.Println("numbers[1:4] ==",numbers[1:4])

  if (numbers == nil){
    fmt.Printf("slice is nil")
  }
}

func printSlice(x []int){
  fmt.Printf("len=%d cap=%d slice=%v\n",len(x),cap(x),x)
}
