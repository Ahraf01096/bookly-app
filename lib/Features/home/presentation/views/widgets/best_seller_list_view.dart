import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_message_widget.dart';
import '../../../../../core/widgets/shimmer_best_Seller.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(
      builder: (context, state) {
        var bookItems = BlocProvider.of<NewestBooksCubit>(context).loadedBooks;
        if(state is NewestBooksSuccess){
          bookItems = state.books.items!;}
        else if(state is NewestBooksFailure){
          return CustomErrorMessageWidget(errMessage: state.errMessage);
        }
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics:  const NeverScrollableScrollPhysics(),
            itemCount: bookItems.length + 1,
            itemBuilder: (context, index) {
              if (index < bookItems.length){
                return  Padding(padding: const EdgeInsets.only(bottom: 20),
                  child: BooksListViewItem(bookModel: bookItems[index]),);

              }else{
                return const ShimmerBestSeller();
              }
            },
          );

        }
    );
  }
}
