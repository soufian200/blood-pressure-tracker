import 'package:bptracker/models/pressure_record_model.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:bptracker/widgets/sys_dia_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class BloodPressureHistory extends StatefulWidget {
  const BloodPressureHistory({Key? key}) : super(key: key);

  @override
  State<BloodPressureHistory> createState() => _BloodPressureHistoryState();
}

class _BloodPressureHistoryState extends State<BloodPressureHistory> {
  List monthlyHistory = [];
  @override
  void initState() {
    var monthlyData = Get.arguments["monthlyData"];
    var ddd = monthlyData.map((record) {
      return PressureRecordModel(
        date: record["date_time_str"] ?? "",
        dateTime: record["date_time"],
        note: record["note"],
        sys: record["sys"],
        dia: record["dia"],
        pulse: record["pulse"],
      );
    }).toList();
    setState(() {
      monthlyHistory = ddd;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(6.r),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(40.r),
              onTap: () {
                Get.back();
              },
              child: Ink(
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          toolbarHeight: 78.h,
          title: Text(
            "History",
            style: TextStyle(fontSize: 32.sp, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
        body: AppContainer(
            child: monthlyHistory.isEmpty
                ? Container(
                    child: AppTitle(
                      txt: "No Data",
                      color: Colors.grey,
                    ),
                  )
                : Column(
                    children: [
                      ...monthlyHistory
                          .map((record) => Container(
                                margin: EdgeInsets.only(bottom: 10.h),
                                child: SysDiaRecord(
                                  pressureRecord: record,
                                ),
                              ))
                          .toList()
                    ],
                  )));
  }
}
