import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualItemView extends StatelessWidget {
  const IndividualItemView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.thirdTitle,
    required this.endTitle,
  });

  final String title;
  final String subTitle;
  final String thirdTitle;
  final String endTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: 358.w,
      width: size.width,
      height: size.height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 137.h),
            CircleAvatar(
              radius: 80.w,
              backgroundColor: Colors.grey,
              // child: const Icon(
              //   Icons.person,
              //   color: Colors.white,
              //   size: 50,
              // ),
            ),
            SizedBox(height: 22.h),
            Text(
              subTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22.47,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              thirdTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22.47,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 22.h),
            Text(
              endTitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17.18,
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
    );
  }
}
