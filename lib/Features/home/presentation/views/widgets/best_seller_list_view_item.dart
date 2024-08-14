import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/models/book_model.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});

  final Items bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView ,extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail??'Test',),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child:  Text(
                        bookModel.volumeInfo!.title != null ? bookModel.volumeInfo!.title! : 'No Title',
                        style: Styles.textStyle20.copyWith(fontFamily: kFontFamily),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 3,),
                   Text(bookModel.volumeInfo!.authors?.isNotEmpty == true
                       ? bookModel.volumeInfo!.authors![0]
                       : 'Unknown', style: Styles.textStyle14,maxLines: 2,),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(bookModel.saleInfo?.listPrice?.amount != null ?'${bookModel.saleInfo!.listPrice!.amount!.round()} ${bookModel.saleInfo!.listPrice!.currencyCode}' : 'Free',style: Styles.textStyle16,),
                      BookRating(bookModel: bookModel,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
