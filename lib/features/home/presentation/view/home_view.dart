import 'package:book_store/features/home/presentation/view/widgets/dialog.dart';
import 'package:book_store/core/utils/resposive_size_config.dart';
import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/core/widgets/custom_button.dart';
import 'package:book_store/core/widgets/custom_cached_network_image.dart';
import 'package:book_store/core/widgets/custom_circular_indicator.dart';
import 'package:book_store/core/widgets/custom_text_form_field.dart';
import 'package:book_store/features/home/presentation/view/widgets/floating_action_button.dart';
import 'package:book_store/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/sqldb.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  static final GlobalKey<_HomeViewState> homeViewStateKey = GlobalKey();

  void refreshHomeViewBody() {
    HomeView.homeViewStateKey.currentState?.widget.refreshHomeViewBody();
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? title;
  String? author;
  String? coverUrl;
  SqlDb dB = SqlDb();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Available Books', style: Styles.textStyle20),
        toolbarHeight: 50.h,
        elevation: 0,
      ),
      body:  HomeViewBody(key: HomeView.homeViewStateKey),
      floatingActionButton: HomeFloatingActionButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            int r = await dB.insert(title!, author!, coverUrl!);
            Navigator.pop(context);
            widget.refreshHomeViewBody();
            setState(() {

            });
          } else {
            autoValidateMode = AutovalidateMode.always;
            setState(() {});
          }
        },
        titleOnSaved: (value) {
          title = value;
        },
        authorOnSaved: (value) {
          author = value;
        },
        coverUrlOnSaved: (value) {
          coverUrl = value;
        },
        formKey: formKey,
        autoValidateMode: autoValidateMode,
      ),
    );
  }
}
