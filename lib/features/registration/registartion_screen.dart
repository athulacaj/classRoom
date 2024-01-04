import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/registration/registration_controller.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
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
    return Consumer(
        builder: (context, RegistrationController registrationController, _) {
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
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: (context, i) {
              //       return ThreeWidgetTile(
              //         title: registrationController.registrations[i].student,
              //         subtitle: registrationController.registrations[i].subject,
              //         // trailing: Text(
              //         //     "age: ${registrationController.registrations[i].size}"),
              //       );
              //     },
              //     separatorBuilder: (context, i) {
              //       return lgVerticalSpace;
              //     },
              //     itemCount: registrationController.registrations.length,
              //   ),
              // )
            ],
          ),
        ),
      );
    });
  }
}
