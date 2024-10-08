import 'package:bloc/bloc.dart';
import 'package:bookly/Features/search/presentation/manager/search_cubit/search_book_state.dart';

import '../../../../../core/models/book_model.dart';
import '../../../data/repo/search_repo.dart';


class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;
  List<Items> loadedBooks = [];
  String searchKey= '';


  Future<void> fetchSearchBook({required String searchKeyword,required int startIndex}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBook(searchKeyword: searchKeyword, startIndex: startIndex,);
    result.fold(
          (failure) => emit(SearchBooksFailure(failure.errMessage)),
          (books) {
        loadedBooks.addAll(books.items as Iterable<Items>);
        emit(SearchBooksSuccess(BookModel(items: loadedBooks)));
      },
    );
  }
}
