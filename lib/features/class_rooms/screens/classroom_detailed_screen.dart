import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/class_room_controller.dart';
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
                                  builder: (context) => goSubjectPage(
                                    onClick: (SubjectModel subjectModel) {
                                      classRoomDetailedController
                                          .addSubjectToClassRoom(subjectModel);
                                      Navigator.of(context).pop();
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
