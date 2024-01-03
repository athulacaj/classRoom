import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/home/constants/home_item_list.dart';
import 'package:test_app/features/home/home_controller.dart';
import 'package:test_app/features/home/model/home_item.dart';
import 'package:test_app/features/home/widgets/home_app_bar.dart';
import 'package:test_app/features/home/widgets/home_card.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(UiConstants.defaultPadding.r),
        child: Column(
          children: [
            /// take more space if tile view
            Consumer<HomeController>(
                builder: (context, HomeController controller, _) {
              return SizedBox(
                height: controller.isTile ? 131.h : 57.h,
              );
            }),

            /// Home Cards
            Wrap(
              spacing: 7.w,
              children: [
                /// show cards from the homeItemsList
                for (final HomeItem item in homeItemsList) HomeCard(item: item)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
