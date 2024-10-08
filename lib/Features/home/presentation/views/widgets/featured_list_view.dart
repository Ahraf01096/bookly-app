import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (context, state) {
       if(state is FeaturedBooksSuccess){
         return Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 10),
           child: SizedBox(
             height: MediaQuery.of(context).size.height * .3,
             child: ListView.builder(
               physics: const BouncingScrollPhysics(),
               itemCount: state.books.items!.length,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) =>  Padding(
                 padding:  const EdgeInsets.only(right: 8),
                 child:  InkWell(
                   onTap: (){
                     GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books.items![index]);
                   },
                   child: CustomBookImage( imageUrl: state.books.items![index].volumeInfo?.imageLinks
                       ?.thumbnail.toString() ??
                       'Test',
                   ),
                 ),
               ),),
           ),
         );
       }else if (state is FeaturedBooksFailure){
         return CustomErrorMessageWidget(errMessage: state.errMessage);
       }else{
        return const CustomLoadingIndicator();
       }
      },
    );
  }
}
