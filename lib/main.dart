import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  runApp(ScreenUtilInit(
    designSize: const Size(414, 736),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, widget) {
      return const GetMaterialApp(
        title: "Blood Pressure Tracker",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          // GetPage(name: "/", page: () => const Tracker()),
        ],
      );
    },
  ));
}
