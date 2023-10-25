import 'package:book_store/core/utils/resposive_size_config.dart';
import 'package:book_store/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFeatureListViewItem extends StatelessWidget {
  const CustomFeatureListViewItem(
      {Key? key, required this.imageUrl, this.borderRadius = 16})
      : super(key: key);
  final String imageUrl;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).w,
        border: Border.all(
          color: Colors.black45,
          width: 2.w,
        ),
      ),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error),
              Text('ERROR', style: Styles.textStyle14),
            ],
          );
        },
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
