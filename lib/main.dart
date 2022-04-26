import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:we_help_app/firebase_options.dart';
import 'package:we_help_app/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            getPages: Routers.getPages,
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: primaryColor,
                  ),
            ),
          );
        });
  }
}
