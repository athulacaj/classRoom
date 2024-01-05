import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/features/students/students_controller.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/goup_shimmer_loading.dart';
import 'package:test_app/utils/common/widgets/individual_item_view.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key, this.onClick});
  final Function? onClick;

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
                      StudentModel studentModel = studentController.students[i];
                      return ThreeWidgetTile(
                        onTap: () {
                          if (widget.onClick != null) {
                            widget.onClick!(studentModel);
                          } else {
                            showBottomSheet(
                              enableDrag: true,
                              context: context,
                              builder: (context) => IndividualItemView(
                                title: "Student Details",
                                subTitle: studentModel.name,
                                thirdTitle: "Age: ${studentModel.age}",
                                endTitle: studentModel.email,
                              ),
                            );
                          }
                        },
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
