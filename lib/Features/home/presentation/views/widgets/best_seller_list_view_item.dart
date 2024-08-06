import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        GoRouter.of(context).push(AppRouter.kBookDetailsView ,extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail??'',),
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
                        bookModel.volumeInfo.title!,
                        style: Styles.textStyle20.copyWith(fontFamily: kFontFamily),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 3,),
                   Text(bookModel.volumeInfo.authors![0],style: Styles.textStyle14,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text('Free',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
                      const Spacer(),
                       BookRating(rating: bookModel.volumeInfo.averageRating?? 0,count: bookModel.volumeInfo.ratingsCount ??0,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
