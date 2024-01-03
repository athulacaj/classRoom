import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/class_rooms/class_room_screen.dart';
import 'package:test_app/features/home/home_controller.dart';
import 'package:test_app/features/home/home_screen.dart';
import 'package:test_app/features/students/students_controller.dart';
import 'package:test_app/features/students/students_screen.dart';
import 'package:test_app/utils/constants/route_constants.dart';

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
            create: (context) => StudentController(),
            child: const StudentScreen());
      },
    ),
    GoRoute(
      path: RouteConstants.classRoom,
      builder: (BuildContext context, GoRouterState state) {
        return const ClassRoomScreen();
      },
    ),
    GoRoute(
      path: RouteConstants.registration,
      builder: (BuildContext context, GoRouterState state) {
        return const ClassRoomScreen();
      },
    ),
  ],
);
