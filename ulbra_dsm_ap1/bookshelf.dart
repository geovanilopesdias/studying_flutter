import 'book.dart';

class Bookshelf{
  String name;
  List<Book> books;
  Bookshelf(this.name, this.books);

  void addBook(Book book){
    books.add(book);
  }

  void removeBookById(int id){
    books.removeWhere((book) => book.id == id);
  }

  void listBooks(){
    books.forEach((book) => book.exhibitDetails());
  }
}
  
