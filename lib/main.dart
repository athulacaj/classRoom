import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: goRoutes,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          colorScheme: const ColorScheme.light(
            primary: Colors.deepPurple,
            secondary: Colors.deepPurpleAccent,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
      ),
    );
  }
}
