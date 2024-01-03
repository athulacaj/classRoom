import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(UiConstants.defaultPadding.w),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Students ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            xlVerticalSpace,
            const ThreeWidgetTile(
              title: "Lourie Thomas",
            ),
          ],
        ),
      ),
    );
  }
}
