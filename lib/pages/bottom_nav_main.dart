import 'package:bptracker/pages/posts.dart';
import 'package:bptracker/pages/settings.dart';
import 'package:bptracker/tabs/blood_pressure_tab.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({Key? key}) : super(key: key);

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _selectedIndex = 0;

  @override
  void initState() {
    ///
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// change navbar bg color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black // navigation bar color
        ));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   backgroundColor: Config.drawer,
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       SizedBox(
      //         height: 130.h,
      //         child: const DrawerHeader(
      //           child: Logo(),
      //         ),
      //       ),
      //       Divider(color: Colors.white.withOpacity(.1)),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.file_download_outlined,
      //           color: Colors.white,
      //         ),
      //         title: "Completed",
      //         onTap: () {
      //           bottomNavbarController.changeSelectedIndex(0);
      //         },
      //       ),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.downloading_outlined,
      //           color: Colors.white,
      //         ),
      //         title: "Downloading",
      //         onTap: () {
      //           bottomNavbarController.changeSelectedIndex(2);
      //         },
      //       ),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.home_rounded,
      //           color: Colors.white,
      //         ),
      //         title: "Home",
      //         onTap: () {
      //           bottomNavbarController.changeSelectedIndex(1);
      //         },
      //       ),
      //       Divider(color: Colors.white.withOpacity(.1)),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.star,
      //           color: Colors.white,
      //         ),
      //         title: 'Rate us',
      //         onTap: () {
      //           LaunchReview.launch(androidAppId: Config.bundleId);
      //         },
      //       ),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.share,
      //           color: Colors.white,
      //         ),
      //         title: 'Share it',
      //         onTap: () {
      //           Share.share(
      //               'https://play.google.com/store/apps/details?id=${Config.bundleId}');
      //         },
      //       ),
      //       DrawerItem(
      //         icon: const Icon(
      //           Icons.tips_and_updates_outlined,
      //           color: Colors.white,
      //         ),
      //         title: 'Update Now',
      //         onTap: () {
      //           LaunchReview.launch(androidAppId: Config.bundleId);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: IndexedStack(
          index: _selectedIndex,
          children: [Posts(), const BloodPressureTab(), Settings()]),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.h, color: Colors.black.withOpacity(.1)),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey.withOpacity(.5),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey.withOpacity(.5),
            ),
            onTap: (val) {
              setState(() {
                _selectedIndex = val;
              });
            },
            elevation: 1,
            iconSize: 35.sp,
            selectedFontSize: 15.sp,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedFontSize: 15.sp,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.import_contacts,
                  size: 45.sp,
                ),
                label: 'Guide',
              ),
              BottomNavigationBarItem(
                icon: Center(
                  child: Icon(
                    Icons.stacked_bar_chart,
                    size: 45.sp,
                  ),
                ),
                label: 'Tracker',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 45.sp,
                ),
                label: 'Settings',
              ),
            ],
          )),
    );
  }
}
