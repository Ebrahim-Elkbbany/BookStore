import 'package:book_store/core/utils/resposive_size_config.dart';
import 'package:book_store/core/widgets/custom_button.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({
    super.key,
    required this.titleOnSaved,
    required this.authorOnSaved,
    required this.coverUrlOnSaved,
    required this.onPressed,
    required this.autoValidateMode,
    required this.formKey,
  });

  final void Function(String?) titleOnSaved;
  final void Function(String?) authorOnSaved;
  final void Function(String?) coverUrlOnSaved;
  final void Function() onPressed;
  final AutovalidateMode autoValidateMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidateMode,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.height(context, 0.05),
                      ),
                      CustomTextField(
                        hint: 'Book title',
                        onSaved: titleOnSaved,
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.02),
                      ),
                      CustomTextField(
                        hint: 'Author',
                        onSaved: authorOnSaved,
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.02),
                      ),
                      CustomTextField(
                          hint: 'Cover url',
                          maxLine: 5,
                          onSaved: coverUrlOnSaved),
                      SizedBox(
                        height: SizeConfig.height(context, 0.04),
                      ),
                      CustomButton(
                        onPressed: onPressed,
                        buttonName: 'Add',
                      ),
                      SizedBox(
                        height: SizeConfig.height(context, 0.013),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      elevation: 0,
      child: Icon(
        Icons.add,
        size: 25.w,
      ),
    );
  }
}
