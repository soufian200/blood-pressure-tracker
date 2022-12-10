import 'package:bptracker/pages/posts.dart';
import 'package:bptracker/pages/settings.dart';
import 'package:bptracker/tabs/blood_pressure_tab.dart';
import 'package:bptracker/utils/ads_manager.dart';
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
  int _selectedIndex = 1;

  @override
  void initState() {
    ///
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///
    AdsManager.initUnityAds();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
