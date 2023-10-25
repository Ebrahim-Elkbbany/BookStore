import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLine = 1, this.onSaved, this.onChanged, this.controller});
  final int maxLine;
  final String hint;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLine,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hint,
        border: borderBuild(),
        enabledBorder: borderBuild(),
        focusedBorder: borderBuild(color: Colors.blue),
      ),
    );
  }

  OutlineInputBorder borderBuild({color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.w),
    );
  }
}
