import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/class_room_controller.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/spacing.dart';
import 'package:test_app/utils/constants/ui_constants.dart';

class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({super.key});

  @override
  State<ClassRoomScreen> createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ClassRoomController classRoomController, _) {
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return ThreeWidgetTile(
                      title: classRoomController.classRooms[i].name,
                      subtitle: classRoomController.classRooms[i].layout,
                      trailing: Text(
                          "age: ${classRoomController.classRooms[i].size}"),
                    );
                  },
                  separatorBuilder: (context, i) {
                    return lgVerticalSpace;
                  },
                  itemCount: classRoomController.classRooms.length,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
