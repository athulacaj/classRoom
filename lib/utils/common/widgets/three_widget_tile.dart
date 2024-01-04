import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/common/widgets/tapable_widget.dart';
import 'package:test_app/utils/constants/colors.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class ThreeWidgetTile extends StatelessWidget {
  const ThreeWidgetTile({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TapAbleWidget(
      onTap: onTap ?? () {},
      child: Container(
        width: size.width,
        height: 66.h,
        padding: EdgeInsets.symmetric(horizontal: UiConstants.largePadding.w),
        decoration: ShapeDecoration(
          color: AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  if (subtitle != null) ...[
                    xsVerticalSpace,
                    Text(subtitle ?? ""),
                  ]
                ],
              ),
            ),
            if (trailing != null) ...[
              smHorizontalSpace,
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
