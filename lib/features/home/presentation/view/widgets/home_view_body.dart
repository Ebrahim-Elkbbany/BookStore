import 'package:book_store/features/home/presentation/view/widgets/dialog.dart';
import 'package:book_store/core/utils/resposive_size_config.dart';
import 'package:book_store/core/utils/styles.dart';
import 'package:book_store/core/widgets/custom_cached_network_image.dart';
import 'package:book_store/core/widgets/custom_circular_indicator.dart';
import 'package:book_store/features/home/presentation/data/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  SqlDb dB = SqlDb();
  void refreshHomeViewBody() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dB.read(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomFeatureListViewItem(
                    imageUrl: snapshot.data![index]['coverUrl'],
                  ),
                  SizedBox(
                    width: SizeConfig.width(context, 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data![index]['title'],
                          style: Styles.textStyle18,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          snapshot.data![index]['author'],
                          style:
                          Styles.textStyle14.copyWith(color: Colors.black45),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      customDialog(
                        index: index,
                        context: context,
                        cancelOnPressed: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                        acceptOnPressed: () {
                          dB.delete(snapshot.data![index]['id']);
                          Navigator.pop(context);
                          setState(
                                () {},
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      size: 30.w,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: SizeConfig.height(context, 0.01),
                );
              },
              itemCount: snapshot.data!.length,
            );
        } else {
          return const CustomCircularIndicator();
        }
      },
    );
  }
}
