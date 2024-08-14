import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error_message_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.items!.length,
            itemBuilder: (context, index) =>  Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CustomBookImage(
                imageUrl: state.books.items?[index].volumeInfo?.imageLinks?.thumbnail??'',
              ),
            ),
          ),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorMessageWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
