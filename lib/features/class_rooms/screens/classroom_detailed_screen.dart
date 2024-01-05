import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/components/siiting_layout.dart';
import 'package:test_app/features/class_rooms/model/class_room_model.dart';
import 'package:test_app/features/class_rooms/screens/class_room_detailed_controller.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/route.dart';
import 'package:test_app/utils/common/custom_icons.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/shimmer_container.dart';
import 'package:test_app/utils/common/widgets/tapable_widget.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class ClassRoomDetailedScreen extends StatefulWidget {
  const ClassRoomDetailedScreen({super.key});

  @override
  State<ClassRoomDetailedScreen> createState() =>
      _ClassRoomDetailedScreenState();
}

class _ClassRoomDetailedScreenState extends State<ClassRoomDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClassRoomDetailedController>(builder:
        (context, ClassRoomDetailedController classRoomDetailedController, _) {
      final classRoomModel = classRoomDetailedController.classRoomModel;

      if (classRoomModel == null) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      final leftCount = classRoomModel.size ~/ 2;
      final rightCount = classRoomModel.size - (classRoomModel.size ~/ 2);
      return Scaffold(
          appBar: commonAppBar(context),
          body: Padding(
            padding: EdgeInsets.all(UiConstants.defaultPadding.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      classRoomModel.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  xlVerticalSpace,
                  if (classRoomDetailedController.isSubjectLoading)
                    ShimmerContainer(
                      width: 358.w,
                      height: 66.h,
                    )
                  else
                    Container(
                      width: 358.w,
                      height: 66.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD0D1D1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          children: [
                            if (classRoomDetailedController.subjectModel !=
                                null)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    classRoomDetailedController
                                        .subjectModel!.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  smVerticalSpace,
                                  Text(
                                    classRoomDetailedController
                                        .subjectModel!.teacher,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              )
                            else
                              const Text("Add Subject"),
                            const Spacer(),
                            TapAbleWidget(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => goSubjectPage(
                                    onClick: (SubjectModel subjectModel) async {
                                      Navigator.of(ctx).pop();
                                      await classRoomDetailedController
                                          .addSubjectToClassRoom(subjectModel);
                                      if (context.mounted) {
                                        showSuccessSnackbar(
                                            context, "Subject Updated");
                                      }
                                    },
                                  ),
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 86,
                                height: 39,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFAAC9BF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Text(
                                  classRoomDetailedController.subjectModel !=
                                          null
                                      ? "Change"
                                      : 'Add',
                                  style: const TextStyle(
                                    color: Color(0xFF0FAB76),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  xlVerticalSpace,
                  if (classRoomModel.layout == "conference")
                    ConferenceSittingLayout(
                        leftCount: leftCount, rightCount: rightCount)
                  else
                    ClassRoomSittingLayout(classRoomModel: classRoomModel),
                ],
              ),
            ),
          ));
    });
  }
}

showSuccessSnackbar(context, msg) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(msg, style: const TextStyle(color: Colors.white)),
    // action: SnackBarAction(
    //   label: 'Undo',
    //   onPressed: () {
    //     // Some code to undo the change.
    //   },
    // ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
