import 'package:flutter/material.dart';
import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final Items book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          book.volumeInfo!.title != null ? book.volumeInfo!.title! : 'No Title',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
    book.volumeInfo!.authors?.isNotEmpty == true
    ? book.volumeInfo!.authors![0]
        : 'Unknown' ,
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(mainAxisAlignment: MainAxisAlignment.center,bookModel: book),
        const SizedBox(
          height: 30,
        ),
         BooksAction(bookModel: book,),
      ],
    );
  }
}
