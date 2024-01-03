import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

PreferredSize commonAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Container(
      padding: EdgeInsets.all(UiConstants.defaultPadding.r),
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, size: 32.r),
            ),
          ],
        ),
      ),
    ),
  );
}
