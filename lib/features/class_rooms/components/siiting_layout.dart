import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/utils/common/custom_icons.dart';
import 'package:test_app/utils/constants/spacing.dart';

class ConferenceSittingLayout extends StatelessWidget {
  const ConferenceSittingLayout({
    super.key,
    required this.leftCount,
    required this.rightCount,
  });

  final int leftCount;
  final int rightCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0; i < leftCount; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Image.asset(
                    CustomIcons.sitingRight,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
            ],
          ),
        ),
        lgHorizontalSpace,
        Container(
          width: 142.w,
          height: (24.h * rightCount) + 260.h,
          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
        ),
        lgHorizontalSpace,
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0; i < rightCount; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Image.asset(
                    CustomIcons.sittingLeft,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class ClassRoomSittingLayout extends StatelessWidget {
  const ClassRoomSittingLayout({
    super.key,
    required this.classRoomModel,
  });

  final ClassRoomModel classRoomModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 13.w,
      children: [
        for (var i = 0; i < classRoomModel.size; i++)
          Container(
            width: 67.w,
            height: 67.w,
            margin: EdgeInsets.only(bottom: 13.w),
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
            ),
            child: Image.asset(
              CustomIcons.sitingRight,
              width: 24.w,
              height: 24.w,
            ),
          ),
      ],
    );
  }
}
