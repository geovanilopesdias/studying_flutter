import 'author.dart';

enum Genre{
  literature,
  textbook,
  academic
}

class Book{
  int id;
  String title;
  int? publicationYear;
  Genre bookGenre;
  List<Author> authors;
  Book(this.id, this.title, this.authors, this.bookGenre);
  
  void exhibitDetails(){
    print("============================================================");
    print("Title: $title (ID $id)");
    print("Genre: ${bookGenre.name}");
    print("Publication Year: ${publicationYear ?? 'Unknown'}");
    print("Authors: ${authors.map((author) => author.name).join(', ')}");
  }
}

