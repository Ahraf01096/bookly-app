import 'package:flutter/material.dart';

void customErrorSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,style: const TextStyle(color: Colors.white),),
    backgroundColor: Colors.red,
  ));
}

void customSuccessSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,style: const TextStyle(color: Colors.white),),
    backgroundColor: Colors.green,
  ));
}
