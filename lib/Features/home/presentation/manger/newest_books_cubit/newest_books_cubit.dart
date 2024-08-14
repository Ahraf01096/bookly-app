import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  List<Items> loadedBooks = [];

  Future<void> fetchNewestBooks({required int startIndex}) async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewsBooks(startIndex: startIndex);

    result.fold((failure) => emit(NewestBooksFailure(failure.errMessage)),
          (books) {
        loadedBooks.addAll(books.items as Iterable<Items>);
        emit(NewestBooksSuccess(BookModel(items: loadedBooks)));
      },
    );
  }
}