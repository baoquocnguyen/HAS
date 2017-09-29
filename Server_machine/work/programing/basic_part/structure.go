/* Learn QUIC with basic step*/
package main

import "fmt"

type Books struct{
  title string
  author string
  subject string
  book_id int
}

func main(){
  var Book1 Books   /* Declare Book1 of type Book */
  var Book2 Books   /* Declare Book1 of type Book */

  /* book 1 specification */
  Book1.title = "Go Programming"
  Book1.author = "Yiping chen"
  Book1.subject = "Go Programming Tutorial"
  Book1.book_id = 123456
  
  /* book 2 specification */
  Book2.title = "Telecom book"
  Book2.author = "Bao Quoc"
  Book2.subject = "Go Programming GO GO"
  Book2.book_id = 987654

  /* print book1 info */
  printBook(Book1)

  /* print book2 info */
  printBook(Book2)
}

func printBook(book Books){
  fmt.Printf("Book title : %s\n", book.title);
  fmt.Printf("Book author : %s\n", book.author);
  fmt.Printf("Book subject : %s\n", book.subject);
  fmt.Printf("Book book_id : %s\n", book.book_id);
}
