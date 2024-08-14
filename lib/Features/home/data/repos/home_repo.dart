import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/book_model.dart';


abstract class HomeRepo
{
 Future<Either<Failure,BookModel>> fetchNewsBooks({required int startIndex});
 Future<Either<Failure,BookModel >> fetchFeaturedBooks();
 Future<Either<Failure ,BookModel>> fetchSimilarBooks({required String category});
 Future<Either<Failure ,BookModel>> fetchSearchBook({required String searchKeyword});

}