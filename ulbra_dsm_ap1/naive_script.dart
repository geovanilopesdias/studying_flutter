import 'book.dart';
import 'author.dart';
import 'bookshelf.dart';
void main() {
  var b1 = Book(1, 'Bárbaros no paraíso', [Author('Pedro Stihl')], Genre.literature);
  b1.publicationYear = 2003;
  var b2 = Book(2, 'Fundamentos da teoria de erros', [Author('José Henrique Vuolo')], Genre.academic);
  var b3 = Book(3, 'Lógica para leigos', [Author('Mark Zegarelli')], Genre.textbook);
  var bks = Bookshelf('ULBRA', [b1, b2, b3]);

  print('=====');
  print('Livros antes da inserção:');
  bks.listBooks();
  print('=====');
  print('Será inserido um novo livro: Os usos do argumento, de Toulmin');
  print('Será, também, removido o livro de id = 2');
  var b4 = Book(4, 'Os usos do argumento', [Author('Stephen Edelston Toulmin')], Genre.academic);
  bks.addBook(b4);
  bks.removeBookById(2);
  bks.listBooks(); 
}
