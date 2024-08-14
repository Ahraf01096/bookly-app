import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/core/widgets/shimmer_best_Seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_error_message_widget.dart';
import '../../manager/search_cubit/search_book_cubit.dart';
import '../../manager/search_cubit/search_book_state.dart';

class SearchListView extends StatefulWidget {
  const SearchListView({super.key});

  @override
  State<SearchListView> createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  final ScrollController scrollController = ScrollController();
  //late List<Items> bookItems = [];
  late int startIndex = 0;

  @override
  void initState() {
     scrollController.addListener(_onScroll);
    super.initState();
  }
  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      startIndex += 10; // Increment the index
      BlocProvider.of<SearchBooksCubit>(context)
          .fetchSearchBook(searchKeyword: BlocProvider.of<SearchBooksCubit>(context).searchKey, startIndex: startIndex);
    }
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<SearchBooksCubit,SearchBooksState>(
          builder: (context, state) {
            var bookItems = BlocProvider.of<SearchBooksCubit>(context).loadedBooks;

            if(state is SearchBooksSuccess){
              bookItems = state.bookModel.items!;
            }else if(state is SearchBooksFailure){
              return CustomErrorMessageWidget(errMessage: state.errMessage);
            }else if(state is SearchBooksInitial){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.image_search_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Book Name',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle20.copyWith(color: Colors.grey),
                  ),
                ],
              );
            }
            return ListView.builder(
              controller: scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: bookItems.length +1,
                itemBuilder: (context, index) {
                  if(index < bookItems.length){
                    return Padding(padding: EdgeInsets.only(bottom: 20),child: BooksListViewItem(bookModel: bookItems[index],),);
                  }else{
                    return const ShimmerBestSellerItem();
                  }
                },);
          },
        )
    );
  }
}
