import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/home/home_controller.dart';
import 'package:test_app/utils/common/custom_icons.dart';
import 'package:test_app/utils/common/widgets/svg_icon.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

PreferredSize homeAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Container(
      padding: EdgeInsets.all(UiConstants.defaultPadding.r),
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                xsVerticalSpace,
                const Text(
                  "Good Morning",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Consumer<HomeController>(
              builder: (BuildContext context, HomeController controller, _) =>
                  IconButton(
                onPressed: () {
                  controller.toggleView();
                },
                icon: controller.isTile
                    ? const SvgIcon(
                        iconPath: CustomIcons.menuTileView,
                      )
                    : const SvgIcon(
                        iconPath: CustomIcons.menuOutline,
                      ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
