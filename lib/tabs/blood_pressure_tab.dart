import 'dart:convert';

import 'package:bptracker/models/pressure_record_model.dart';
import 'package:bptracker/models/sys_dia_stats.dart';
// import 'package:bptracker/pages/pressure_record.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_button.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:bptracker/widgets/label.dart';
import 'package:bptracker/widgets/sys_dia_bar_char.dart';
import 'package:bptracker/widgets/sys_dia_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodPressureTab extends StatefulWidget {
  const BloodPressureTab({Key? key}) : super(key: key);

  @override
  State<BloodPressureTab> createState() => _BloodPressureTabState();
}

class _BloodPressureTabState extends State<BloodPressureTab> {
  List<PressureRecordModel> latest = [];
  List<SysDiaStats> sysDiaBarCharData = [];

  ///
  void _loadLatestData() async {
    final prefs = await SharedPreferences.getInstance();
    String y = DateTime.now().year.toString();
    String mo = DateTime.now().month.toString();
    String? yData = prefs.getString(y);
    if (yData == null) {
      print("no record for this year($y)");
      return;
    }
    Map yDataDecoded = json.decode(yData);
    Map? mData = yDataDecoded[mo];
    if (mData == null) {
      print("no record for this month($mo)");
      return;
    }

    Map mDataSorted = Map.fromEntries(
        mData.entries.toList()..sort((e1, e2) => e2.key.compareTo(e1.key)));
    int maxLatest = 5;
    int lenLatest = mDataSorted.values.toList().length;
    List<PressureRecordModel> latestData = mDataSorted.values
        .toList()
        .sublist(0, lenLatest > maxLatest ? maxLatest : lenLatest)
        .map((decodedContext) {
      return PressureRecordModel(
        date: decodedContext["date_time_str"] ?? "",
        dateTime: decodedContext["date_time"],
        note: decodedContext["note"],
        sys: decodedContext["sys"],
        dia: decodedContext["dia"],
        pulse: decodedContext["pulse"],
      );
    }).toList();
    setState(() {
      latest = latestData;
    });
  }

  /// Load This Month Data
  _loadMonthData() async {
    final prefs = await SharedPreferences.getInstance();
    String y = DateTime.now().year.toString();
    String mo = DateTime.now().month.toString();
    String? yData = prefs.getString(y);
    if (yData == null) {
      print("no record for this year($y)");
      return;
    }
    Map yDataDecoded = json.decode(yData);
    Map? mData = yDataDecoded[mo];
    if (mData == null) {
      print("no record for this month($mo)");
      return;
    }
    List<SysDiaStats> sysDiaBarCharDataClean =
        mData.values.toList().map((data) {
      return SysDiaStats(
          '${data["date_time"]["day"]}/${data["date_time"]["month"]}',
          data["sys"],
          data["dia"]);
    }).toList();
    setState(() {
      sysDiaBarCharData = sysDiaBarCharDataClean;
    });
  }

  @override
  void initState() {
    _loadMonthData();
    _loadLatestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
          child: Column(
        children: [
          SizedBox(height: 20.sp),
          AppCard(
            child: Column(children: [
              Label(
                title: "Systolic",
                subtitle: "mmHg",
                number: 55,
              ),
              SizedBox(height: 17.h),
              Label(
                title: "Diastolic",
                subtitle: "mmHg",
                number: 55,
                numberColor: Colors.blueAccent,
              ),
              SizedBox(height: 17.h),
              Label(
                title: "Pulse",
                subtitle: "BMP",
                number: 55,
                numberColor: Colors.green,
              ),
            ]),
          ),
          SizedBox(height: 20.sp),
          Row(
            children: [
              AppTitle(
                txt: "This Month",
                fontSize: 25.sp,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          AppCard(
            child: Column(
              children: [
                ///

                SysDiaBarChar(data: sysDiaBarCharData),

                // SysDiaBarChar(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.r,
                          height: 10.r,
                          color: AppColors.systolic,
                        ),
                        SizedBox(width: 5.w),
                        const Text("Systolic")
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Row(
                      children: [
                        Container(
                          width: 10.r,
                          height: 10.r,
                          color: AppColors.diastolic,
                        ),
                        SizedBox(width: 5.w),
                        const Text("Diastolic")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.sp),
          Row(
            children: [
              AppTitle(
                txt: "Latest",
                fontSize: 25.sp,
                color: Colors.black.withOpacity(.6),
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          latest.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  height: 100.h,
                  child: Center(
                    child: AppTitle(
                      txt: "No Records",
                      color: Colors.grey,
                    ),
                  ),
                )
              : Column(
                  children: [
                    ...latest
                        .map((record) => Container(
                              margin: EdgeInsets.only(bottom: 10.h),
                              child: SysDiaRecord(
                                pressureRecord: record,
                              ),
                            ))
                        .toList()
                  ],
                ),
          SizedBox(height: 10.sp),
          AppButton(
            label: "See All History",
            onTap: () {
              print("See all history");
            },
          ),
          SizedBox(height: 100.sp),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          size: 25.sp,
        ),
        onPressed: () {
          Get.toNamed("/pressure_record");
        },
      ),
    );
  }
}
