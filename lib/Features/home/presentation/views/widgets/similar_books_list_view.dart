import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding:  EdgeInsets.only(right: 5),
          child:  CustomBookImage(imageUrl: 'https://th.bing.com/th/id/OIP.PP8HlRvOSRjFTmcAxlrWmAHaLH?w=3744&h=5616&rs=1&pid=ImgDetMain',),
        ),),
    );
  }
}
