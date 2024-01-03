import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/home/home_controller.dart';
import 'package:test_app/features/home/model/home_item.dart';
import 'package:test_app/utils/common/widgets/svg_icon.dart';
import 'package:test_app/utils/common/widgets/tapable_widget.dart';
import 'package:test_app/utils/constants/spacing.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.item,
  });

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    bool isTile = Provider.of<HomeController>(context).isTile;
    final Size size = MediaQuery.of(context).size;
    return TapAbleWidget(
      onTap: () {
        if (item.route != null) {
          GoRouter.of(context).push(item.route!);
        }
      },
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
        width: isTile ? size.width : 175.w,
        height: isTile ? 48.h : 216.h,
        margin: EdgeInsets.only(bottom: 28.h),
        decoration: ShapeDecoration(
          color: item.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isTile) ...[
              SvgIcon(
                iconPath: item.icon,
                width: 48.w,
                height: 48.w,
              ),
              mdVerticalSpace,
            ],
            Text(
              item.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 3, 3, 3),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
