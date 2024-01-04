import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/class_room_controller.dart';
import 'package:test_app/features/class_rooms/screens/classroom_detailed_screen.dart';
import 'package:test_app/features/students/students_screen.dart';
import 'package:test_app/utils/common/widgets/app_bar.dart';
import 'package:test_app/utils/common/widgets/three_widget_tile.dart';
import 'package:test_app/utils/constants/route_constants.dart';
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
                  'Class Rooms',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              xlVerticalSpace,
              if (classRoomController.isLoading)
                const GoupTileShimmer()
              else
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, i) {
                      return ThreeWidgetTile(
                        title: classRoomController.classRooms[i].name,
                        subtitle: classRoomController.classRooms[i].layout,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              classRoomController.classRooms[i].size.toString(),
                            ),
                            const Text("Seats"),
                          ],
                        ),
                        onTap: () {
                          context.push(
                            "${RouteConstants.classRoom}/${classRoomController.classRooms[i].id}",
                          );
                        },
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
