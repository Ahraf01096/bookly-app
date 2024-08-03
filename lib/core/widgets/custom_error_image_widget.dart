import 'package:flutter/material.dart';

import '../utils/style.dart';

class CustomErrorImageWidget extends StatelessWidget {
  const CustomErrorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all(color: Colors.red)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error,size: 30 ,color: Colors.red,),
            Text('Error',style: Styles.textStyle16.copyWith(color: Colors.red),)
          ],
        ));
  }
}
