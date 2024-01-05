import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/registration/model/registration_model.dart';
import 'package:test_app/features/registration/registration_controller.dart';
import 'package:test_app/features/students/model/student_model.dart';
import 'package:test_app/features/subjects/model/subject_model.dart';
import 'package:test_app/route.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/shimmer_container.dart';
import 'package:test_app/utils/common/widgets/tapable_widget.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar(context),
      body: Consumer<RegistrationController>(
          builder: (context, RegistrationController registrationController, _) {
        if (registrationController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return FutureBuilder(
                        future:
                            registrationController.getStudentNameAndClassRoom(
                                registrationController.registrations[i].student,
                                registrationController
                                    .registrations[i].subject),
                        builder: (context,
                            AsyncSnapshot<(StudentModel, SubjectModel)>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ShimmerContainer(
                                width: size.width, height: 66.h);
                          }
                          final (studentModel, subjectModel) = snapshot.data!;

                          return ThreeWidgetTile(
                            onTap: () {
                              showBottomSheet(
                                enableDrag: true,
                                context: context,
                                builder: (context) => RegisterViewDialog(
                                  studentModel: studentModel,
                                  subjectModel: subjectModel,
                                  registrationModel:
                                      registrationController.registrations[i],
                                ),
                              );
                            },
                            title:
                                "Registration Id: #${registrationController.registrations[i].id}",
                            // trailing: Text(
                            //     "age: ${registrationController.registrations[i].size}"),
                          );
                        });
                  },
                  separatorBuilder: (context, i) {
                    return lgVerticalSpace;
                  },
                  itemCount: registrationController.registrations.length,
                ),
              ),
              xlVerticalSpace,
              TapAbleWidget(
                onTap: () {
                  showBottomSheet(
                    enableDrag: true,
                    context: context,
                    builder: (context) => const RegistrationDialog(),
                  );
                },
                child: Container(
                  width: 177.w,
                  height: 48.h,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  decoration: ShapeDecoration(
                    color: const Color(0x26007AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New Registration',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF007AFF),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RegistrationDialog extends StatelessWidget {
  const RegistrationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        RegistrationController registrationController =
            context.watch<RegistrationController>();

        if (registrationController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          height: size.height,
          color: const Color.fromRGBO(255, 255, 255, 1),
          padding: EdgeInsets.all(UiConstants.defaultPadding.w),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'New Registration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              xlVerticalSpace,
              Column(
                children: [
                  registrationController.selectedStudent != null
                      ? registrationController.selectedStudent!.name
                      : "Select a Student",
                  registrationController.selectedSubject != null
                      ? registrationController.selectedSubject!.name
                      : "Select a Subject",
                ]
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: ThreeWidgetTile(
                          onTap: () {
                            if (e == "Select a Student") {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return goStudentPage(
                                    onClick: (StudentModel studentModel) async {
                                  registrationController
                                      .selectStudent(studentModel);
                                  Navigator.pop(ctx);
                                });
                              }));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return goSubjectPage(
                                  onClick: (SubjectModel subjectModel) async {
                                    registrationController
                                        .selectSubject(subjectModel);
                                    Navigator.pop(context);
                                  },
                                );
                              }));
                            }
                          },
                          title: e,
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 32.w,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 54.h,
              ),
              TapAbleWidget(
                onTap: () async {
                  await registrationController.register();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 107,
                  height: 48,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                  decoration: ShapeDecoration(
                    color: registrationController.isRegisterButtonEnabled()
                        ? const Color(0xFF0FAB76)
                        : const Color(0xFF0FAB76).withOpacity(.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class RegisterViewDialog extends StatelessWidget {
  const RegisterViewDialog({
    super.key,
    required this.studentModel,
    required this.subjectModel,
    required this.registrationModel,
  });
  final StudentModel studentModel;
  final SubjectModel subjectModel;
  final RegistrationModel registrationModel;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        RegistrationController registrationController =
            context.watch<RegistrationController>();

        if (registrationController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          height: size.height,
          color: const Color.fromRGBO(255, 255, 255, 1),
          padding: EdgeInsets.all(UiConstants.defaultPadding.w),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Registration',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              xlVerticalSpace,
              ViewLayout(
                title: "Student Details",
                subTitle: studentModel.name,
                thirdTitle: studentModel.email,
                endTitle: "Age : ${studentModel.age}",
              ),
              xlVerticalSpace,
              ViewLayout(
                title: "Subject Details",
                subTitle: subjectModel.name,
                thirdTitle: subjectModel.teacher,
                endTitle: "Credit : ${subjectModel.credits}",
              ),
              const Spacer(),
              TapAbleWidget(
                onTap: () async {
                  await registrationController.delete(registrationModel.id);
                  await registrationController.init();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 193.w,
                  height: 48.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF9614F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Delete Registration',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ViewLayout extends StatelessWidget {
  const ViewLayout({
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
    return Container(
      width: 358.w,
      height: 100.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFD0D1D1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
      child: Row(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  thirdTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
          const Spacer(),
          Text(
            endTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
