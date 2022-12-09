import 'package:bptracker/pages/blood_pressure_history.dart';
import 'package:bptracker/pages/post_detail.dart';
import 'package:bptracker/pages/posts.dart';
import 'package:bptracker/pages/pressure_record.dart';
import 'package:bptracker/tabs/blood_pressure_tab.dart';
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
      return GetMaterialApp(
        title: "History",
        debugShowCheckedModeBanner: false,
        initialRoute: '/posts',
        getPages: [
          GetPage(name: "/", page: () => const BloodPressureTab()),
          GetPage(name: "/posts", page: () => Posts()),
          GetPage(name: "/post_detail", page: () => const PostsDetail()),
          GetPage(
              name: "/blood_pressure_history",
              page: () => const BloodPressureHistory()),
          GetPage(name: "/pressure_record", page: () => const PressureRecord()),
        ],
      );
    },
  ));
}
