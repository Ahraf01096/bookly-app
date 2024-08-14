import 'package:bookly/Features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/book_model.dart';
import '../../../../core/utils/api_service.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchSearchBook({
    required String searchKeyword,
    required int startIndex,
  }) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=$searchKeyword&startIndex=$startIndex');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
