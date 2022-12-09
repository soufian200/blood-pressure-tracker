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
import 'package:bptracker/widgets/monthly_head.dart';
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
  int maxLatest = 5;
  List<PressureRecordModel> latest = [];
  List<SysDiaStats> sysDiaBarCharData = [];
  List _allMonthsData = [];

  Map<String, dynamic> _stats = {
    "sys": {"max": 0, "min": 0},
    "dia": {"max": 0, "min": 0},
    "pulse": {"max": 0, "min": 0}
  };

  void _resetUIData() {
    setState(() {
      _stats = {
        "sys": {"max": 0, "min": 0},
        "dia": {"max": 0, "min": 0},
        "pulse": {"max": 0, "min": 0}
      };
      latest = [];
      sysDiaBarCharData = [];
      _allMonthsData = [];
    });
  }

  ///
  void _loadLatestData() async {
    if (_allMonthsData.isEmpty) {
      print("Empty.....");
      return;
    }
    int lenLatest = _allMonthsData.length;
    List<PressureRecordModel> latestData = _allMonthsData
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

  Future<void> _getMonthList() async {
    print("Start calling _getMonthList.....");

    final prefs = await SharedPreferences.getInstance();
    String y = items[selectedMonthIndex].split(" ")[1];
    String mo = (selectedMonthIndex + 1).toString();
    print("Getting Data by this Date: $mo/$y...........");
    String? yData = prefs.getString(y);
    // print(yData);
    if (yData == null) {
      print("no record for this year($y)");

      return;
    }

    Map yDataDecoded = json.decode(yData);
    Map? mData = yDataDecoded[mo];
    if (mData == null) {
      print("no record for this month($mo)");
      // _resetUIData();
      return;
    }

    Map mDataSorted = Map.fromEntries(
        mData.entries.toList()..sort((e1, e2) => e2.key.compareTo(e1.key)));
    List dd = mDataSorted.values.toList();
    setState(() {
      _allMonthsData = dd;
    });
    // return dd;
  }

  ///
  void _loadMonthStats() async {
    var allMonthData = _allMonthsData;
    if (allMonthData.isEmpty) {
      print("Empty.....");
      return;
    }

    /// suppose the first item is min and max
    int sMax = allMonthData[0]["sys"];
    int sMin = allMonthData[0]["sys"];
    int dMax = allMonthData[0]["dia"];
    int dMin = allMonthData[0]["dia"];
    int pMax = allMonthData[0]["pulse"];
    int pMin = allMonthData[0]["pulse"];

    /// then loop through the rest and compare crr and previous
    for (var decodedContext in allMonthData) {
      int sVal = decodedContext["sys"];
      int dVal = decodedContext["dia"];
      int pVal = decodedContext["pulse"];

      if (sVal > sMax) {
        sMax = sVal;
      } else if (sVal < sMin) {
        sMin = sVal;
      }
      if (dVal > dMax) {
        dMax = dVal;
      } else if (dVal < dMin) {
        dMin = dVal;
      }
      if (pVal > pMax) {
        pMax = pVal;
      } else if (pVal < pMin) {
        pMin = pVal;
      }
    }

    setState(() {
      _stats["sys"]["max"] = sMax;
      _stats["sys"]["min"] = sMin;
      _stats["dia"]["max"] = dMax;
      _stats["dia"]["min"] = dMin;
      _stats["pulse"]["max"] = pMax;
      _stats["pulse"]["min"] = pMin;
    });
  }

  /// Load This Month Data
  _loadMonthCharData() async {
    var allMonthData = _allMonthsData;
    if (allMonthData.isEmpty) {
      print("Empty.....");
      return;
    }

    List<SysDiaStats> sysDiaBarCharDataClean = allMonthData.map((data) {
      return SysDiaStats(
          '${data["date_time"]["day"]}/${data["date_time"]["month"]}',
          data["sys"],
          data["dia"]);
    }).toList();

    setState(() {
      sysDiaBarCharData = sysDiaBarCharDataClean;
    });
  }

  int selectedMonthIndex = DateTime.now().month - 1;

  void _refreshDataBySelectDate() async {
    _resetUIData();
    await _getMonthList();
    _loadMonthStats();
    _loadMonthCharData();
    _loadLatestData();
  }

  ///
  void _loadFakeData() async {
    final prefs = await SharedPreferences.getInstance();
    print("Clearing.....");
    prefs.clear();
    // print("Loading Fake Date.....");
    // fakeData.keys.toList().forEach((k) {
    //   // print(k);
    //   // print(fakeData[k]);
    //   prefs.setString(k, json.encode(fakeData[k]));
    // });
  }

  @override
  void initState() {
    // _loadFakeData();

    _refreshDataBySelectDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78.h,
        title: Text(
          "Blood Pressure Tracker",
          style: TextStyle(fontSize: 32.sp, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: AppContainer(
          child: Column(
        children: [
          SizedBox(height: 10.sp),
          MonthlyHead(
            selectedMonthIndex: selectedMonthIndex,
            onChange: (val) {
              setState(() {
                selectedMonthIndex = items.indexOf(val!);
              });
              _refreshDataBySelectDate();
            },
          ),
          SizedBox(height: 10.sp),
          Column(
            children: [
              AppCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 60.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.h,
                                  color: Colors.grey.withOpacity(.3)),
                            ),
                          ),
                          child: Center(
                            child: AppTitle(
                              txt: "Max",
                              fontSize: 25.sp,
                              color: Colors.black.withOpacity(.6),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          width: 60.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.h,
                                  color: Colors.grey.withOpacity(.3)),
                            ),
                          ),
                          child: Center(
                            child: AppTitle(
                              txt: "Min",
                              fontSize: 25.sp,
                              color: Colors.black.withOpacity(.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(children: [
                      Label(
                        title: "Systolic",
                        subtitle: "mmHg",
                        color: AppColors.systolic,
                        stats: {
                          "min": _stats["sys"]["min"],
                          "max": _stats["sys"]["max"]
                        },
                      ),
                      SizedBox(height: 17.h),
                      Label(
                        title: "Diastolic",
                        subtitle: "mmHg",
                        color: AppColors.diastolic,
                        stats: {
                          "min": _stats["dia"]["min"],
                          "max": _stats["dia"]["max"]
                        },
                      ),
                      SizedBox(height: 17.h),
                      Label(
                        title: "Pulse",
                        subtitle: "BMP",
                        color: AppColors.pulse,
                        stats: {
                          "min": _stats["pulse"]["min"],
                          "max": _stats["pulse"]["max"]
                        },
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 20.sp),
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
                    color: Colors.black.withOpacity(.5),
                    // fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              latest.isEmpty
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
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
                                    onAfterDelete: (bool? isDeleted,
                                        PressureRecordModel record) {
                                      if (isDeleted != null && isDeleted) {
                                        _refreshDataBySelectDate();
                                      }
                                    },
                                  ),
                                ))
                            .toList()
                      ],
                    ),
              _allMonthsData.length < maxLatest
                  ? const SizedBox()
                  : SizedBox(height: 10.sp),
              _allMonthsData.length <= maxLatest
                  ? const SizedBox()
                  : AppButton(
                      label: "See All History",
                      onTap: () async {
                        bool isStateChanged = await Get.toNamed(
                            "/blood_pressure_history",
                            arguments: {"monthlyData": _allMonthsData});
                        // print("RESULT: $r");
                        if (isStateChanged) {
                          _refreshDataBySelectDate();
                        }
                      },
                    ),
              SizedBox(height: 100.sp),
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          size: 25.sp,
        ),
        onPressed: () async {
          var isAdded = await Get.toNamed("/pressure_record");
          if (isAdded != null && isAdded) {
            _refreshDataBySelectDate();
          }
        },
      ),
    );
  }
}
