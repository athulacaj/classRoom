import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/features/students/students_controller.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/shimmer_container.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentController>(
        builder: (context, StudentController studentController, _) {
      return Scaffold(
        appBar: commonAppBar(context),
        body: Padding(
          padding: EdgeInsets.all(UiConstants.defaultPadding.w),
          child: Column(
            children: [
              const Center(
                child: Hero(
                  tag: "students",
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
              ),
              xlVerticalSpace,
              if (studentController.isLoading)
                const GoupTileShimmer()
              else
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, i) {
                      return ThreeWidgetTile(
                        title: studentController.students[i].name,
                        subtitle: studentController.students[i].email,
                        trailing:
                            Text("age: ${studentController.students[i].age}"),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return lgVerticalSpace;
                    },
                    itemCount: studentController.students.length,
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}

class GoupTileShimmer extends StatelessWidget {
  const GoupTileShimmer({
    super.key,
    this.count = 7,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, i) {
          return ShimmerContainer(width: size.width, height: 66.h);
        },
        separatorBuilder: (context, i) {
          return lgVerticalSpace;
        },
        itemCount: count,
      ),
    );
  }
}
