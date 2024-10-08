import 'package:bookly/core/utils/functions/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/book_model.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
final Items bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
           Expanded(
              child: CustomButton(
                text: bookModel.saleInfo?.listPrice?.amount != null ?'${bookModel.saleInfo!.listPrice?.amount!.round()} ${bookModel.saleInfo!.listPrice!.currencyCode}' : 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              )),
          Expanded(
              child: CustomButton(
                onPressed: () {
                  launchCustomUrl(context, bookModel.volumeInfo!.previewLink!);
                },
                fontSize: 16,
                text: getText(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
              )),
        ],
      ),
    );
  }

 String getText(Items bookModel) {
    if(bookModel.volumeInfo?.previewLink == null){
      return 'Not Available';
    }else{
      return 'Preview';
    }
 }
}
