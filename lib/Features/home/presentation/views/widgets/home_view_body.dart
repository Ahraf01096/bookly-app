import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/featured_books_cubit/featured_books_cubit.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController scrollController = ScrollController();
  int startIndex = 0;
  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }
  void _onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      // User reached the end of the list, fetch more data
      startIndex += 10; // Increment the index
      BlocProvider.of<NewestBooksCubit>(context)
          .fetchNewestBooks(startIndex: startIndex);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   RefreshIndicator(
      onRefresh: () {
        return refreshAllData(context);
      },
      child: CustomScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: const [
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListView(),
            ),
          )
        ],
      ),
    );
  }
}
Future<void> refreshAllData(context) async
{
  BlocProvider.of<NewestBooksCubit>(context).loadedBooks.clear();
  BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(startIndex: 0);
  BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
}