import 'package:bptracker/tabs/heart_rate_tab.dart';
import 'package:bptracker/tabs/blood_pressure_tab.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  ///
  final List<Widget> _tabs = [const BloodPressureTab(), const HeartRateTab()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tracker",
            style: TextStyle(fontSize: 36.sp, color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: AppColors.primary,
          bottom: TabBar(
            unselectedLabelColor: Colors.white.withOpacity(.5),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
            labelColor: Colors.white,
            indicatorColor: Colors.white.withOpacity(.5),
            indicatorWeight: .5 * 1.h,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
            tabs: const [
              Tab(child: Text("Blood Pressure")),
              Tab(child: Text("Heart Pressure")),
            ],
          ),
        ),
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}
