import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/models/book_model.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async{
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=Programing');

     BookModel books = BookModel.fromJson(data);

      return right(books);
    } catch (e) {
      left(ServerFailure(e.toString()));
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchNewsBooks({required int startIndex}) async {

      try {
        var data = await apiService.get(
            endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=$startIndex');
        BookModel books =BookModel.fromJson(data);
        return right(books);
      } on Exception catch (e) {
        if(e is DioError){
          return left(ServerFailure.fromDioError(e));
        }else{
          return left(ServerFailure(e.toString()));
        }
      }


  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=Subject:$category');

      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, BookModel>> fetchSearchBook({required String searchKeyword}) async{
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=Subject:$searchKeyword');
      BookModel books = BookModel.fromJson(data);
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }


}
