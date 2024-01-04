import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/class_room_controller.dart';
import 'package:test_app/features/class_rooms/class_room_repository.dart';
import 'package:test_app/features/class_rooms/class_room_screen.dart';
import 'package:test_app/features/home/home_controller.dart';
import 'package:test_app/features/home/home_screen.dart';
import 'package:test_app/features/registration/registartion_screen.dart';
import 'package:test_app/features/registration/registration_controller.dart';
import 'package:test_app/features/registration/registration_repository.dart';
import 'package:test_app/features/students/students_controller.dart';
import 'package:test_app/features/students/students_repository.dart';
import 'package:test_app/features/students/students_screen.dart';
import 'package:test_app/features/subjects/subject_controller.dart';
import 'package:test_app/features/subjects/subject_repository.dart';
import 'package:test_app/features/subjects/subjects_Screen.dart';
import 'package:test_app/utils/common/api/api_helper.dart';
import 'package:test_app/utils/common/api/api_operations.dart';
import 'package:test_app/utils/constants/route_constants.dart';

ApiHelper apiHelper = ApiHelper(apiOperation: ApiOperation());

final GoRouter goRoutes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RouteConstants.home,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
          child: const HomeScreen(),
        );
      },
      // routes: <RouteBase>[],
    ),
    GoRoute(
      path: RouteConstants.students,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider<StudentController>(
            create: (context) => StudentController(
                    studentRepostitory: StudentRepostitory(
                  apiHelper: apiHelper,
                )),
            child: const StudentScreen());
      },
    ),
    GoRoute(
      path: RouteConstants.subjects,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider<SubJectController>(
            create: (context) => SubJectController(
                  subjectRepostitory: SubjectRepostitory(
                    apiHelper: apiHelper,
                  ),
                ),
            child: const SubjectScreen());
      },
    ),
    GoRoute(
      path: RouteConstants.classRoom,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider<ClassRoomController>(
            create: (context) => ClassRoomController(
                  classRoomRepostitory: ClassRoomRepostitory(
                    apiHelper: apiHelper,
                  ),
                ),
            child: const ClassRoomScreen());
      },
    ),
    GoRoute(
      path: RouteConstants.registration,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (context) => RegistrationController(
            registrationRepostitory: RegistrationRepostitory(
              apiHelper: apiHelper,
            ),
          ),
          child: const RegistrationScreen(),
        );
      },
    ),
  ],
);
