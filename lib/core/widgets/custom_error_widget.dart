import 'package:book_store/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text(errorMessage,style: Styles.textStyle20,textAlign: TextAlign.center));
  }
}
