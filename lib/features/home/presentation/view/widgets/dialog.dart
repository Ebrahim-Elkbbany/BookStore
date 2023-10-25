import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customDialog({
  required int index,
  required context,
  required void Function()? cancelOnPressed,
  required void Function()? acceptOnPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title:  Text(
          'Delete Book',
          style: Styles.textStyle18,
        ),
        content:  Text(
          'Are you sure you want to delete this book ?',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
        ),
        actions: [
          CustomTextButton(
            onPressed: cancelOnPressed,
            text: 'Cancel',
            textStyle:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black45,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: CustomTextButton(
              onPressed: acceptOnPressed,
              text: 'Yes',
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
