import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorMessageWidget extends StatelessWidget {
  const CustomErrorMessageWidget({super.key, required this.errMessage});
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return  Text(errMessage,style: Styles.textStyle18,);
  }
}
