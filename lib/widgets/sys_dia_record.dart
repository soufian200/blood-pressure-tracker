import 'dart:convert';

import 'package:bptracker/Methods/get_sys_dia_status.dart';
import 'package:bptracker/models/bp_status.dart';
import 'package:bptracker/models/pressure_record_model.dart';
import 'package:bptracker/utils/ads_manager.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_button.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SysDiaRecord extends StatelessWidget {
  SysDiaRecord({Key? key, required this.pressureRecord, this.onAfterDelete})
      : super(key: key);

  PressureRecordModel pressureRecord;
  final void Function(bool?, PressureRecordModel)? onAfterDelete;

  ///

  @override
  Widget build(BuildContext context) {
    BPStatus bpStatus = getSysDiaStatus(pressureRecord.sys, pressureRecord.dia);
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.black.withOpacity(.4),
        borderRadius: BorderRadius.circular(40.r),
        onTap: () {
          var r = showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                ///
                void _deletePressureRecord() async {
                  AdsManager.showInterAd();
                  Map dateTime = pressureRecord.dateTime;
                  String y = dateTime["year"].toString();
                  String mo = dateTime["month"].toString();
                  final prefs = await SharedPreferences.getInstance();
                  String yData = prefs.getString(y)!;
                  Map yDataDecoded = json.decode(yData);

                  Map mData = yDataDecoded[mo];
                  print("========");
                  // print("$day/$mo/$y");
                  print(mData.keys.toList().length);
                  mData.remove(pressureRecord.date);
                  print(pressureRecord.date);
                  // print(mData.keys.toList());
                  print(mData.keys.toList().length);
                  yDataDecoded[mo] = mData;
                  String encodedData = json.encode(yDataDecoded);
                  prefs.setString(y, encodedData);
                  onAfterDelete!(true, pressureRecord);

                  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                    backgroundColor: Colors.black.withOpacity(.7),
                    content: const Text('Deleted Successfully'),
                  ));

                  Get.back();
                  // Get.offAllNamed("/");
                  // Map dayData = mData[pressureRecord.date];

                  // print(dayData);
                }

                return Container(
                    height: .9.sh,
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      children: [
                        AdsManager.bannerAd(),
                        Text(pressureRecord.date.toString(),
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary)),
                        SizedBox(height: 15.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 22.w),
                          decoration: BoxDecoration(
                              color: bpStatus.color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.r))),
                          child: AppTitle(
                            txt: bpStatus.label,
                            maxLine: 2,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: bpStatus.color == AppColors.elevated
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(12.r),
                                  // width: 120.w,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(14.r))),
                                  child: Column(
                                    children: [
                                      AppTitle(
                                        txt: "Systolic",
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                      AppTitle(
                                        txt: "( mmHg )",
                                        fontSize: 19.sp,
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                      SizedBox(width: 10.w),
                                      CountReading(AppColors.systolic,
                                          pressureRecord.sys),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 40.w),
                                Column(
                                  children: [
                                    AppTitle(
                                      txt: "Diastolic",
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(.7),
                                    ),
                                    AppTitle(
                                      txt: "( mmHg )",
                                      fontSize: 19.sp,
                                      color: Colors.black.withOpacity(.5),
                                    ),
                                    SizedBox(width: 10.w),
                                    CountReading(AppColors.diastolic,
                                        pressureRecord.dia),
                                  ],
                                ),
                                SizedBox(width: 40.w),
                                Column(
                                  children: [
                                    AppTitle(
                                      txt: "Pulse",
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black.withOpacity(.7),
                                    ),
                                    AppTitle(
                                      txt: "( 💗 BPM )",
                                      fontSize: 19.sp,
                                      color: Colors.black.withOpacity(.5),
                                    ),
                                    SizedBox(width: 10.w),
                                    CountReading(
                                        AppColors.pulse, pressureRecord.pulse),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              height: 5.h,
                              color: Colors.grey.withOpacity(.3),
                            )
                          ],
                        ),
                        SizedBox(height: 25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppTitle(
                              txt: "📔 Note",
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.h),
                        pressureRecord.note == ""
                            ? AppTitle(
                                txt: "No Notes",
                                fontSize: 13.sp,
                                color: Colors.grey,
                              )
                            : Text(
                                pressureRecord.note,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                  fontSize: 16.sp,
                                ),
                              ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            // Expanded(
                            //   child: AppButton(
                            //       label: "Edit",
                            //       bg: Colors.blue,
                            //       onTap: () {
                            //         print("edit");
                            //       }),
                            // ),
                            // SizedBox(width: 10.w),
                            Expanded(
                              child: AppButton(
                                  label: "Delete",
                                  bg: Colors.red,
                                  onTap: _deletePressureRecord),
                            )
                          ],
                        )
                      ],
                    ));
              });
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: AppCard(
            padding: 10.r,
            child: SizedBox(
              height: 105.h,
              // width: 460.w,
              child: Row(
                children: [
                  ///
                  Container(
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountReading(AppColors.systolic, pressureRecord.sys),
                        CountReading(AppColors.diastolic, pressureRecord.dia),
                      ],
                    ),
                  ),

                  ///
                  Container(
                    margin: EdgeInsets.only(left: 3.w, right: 10.w),
                    width: 5.w,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: bpStatus.color,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  ),

                  ///
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pressureRecord.date.toString(),
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.primary)),
                            SizedBox(
                              // color: Colors.red,
                              width: 255.w,
                              child: AppTitle(
                                txt: bpStatus.label,
                                maxLine: 2,
                                fontSize: 23.sp,
                                color: Colors.black.withOpacity(.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            AppTitle(
                              txt:
                                  "Pulse: ${pressureRecord.pulse.toString()} 💗 BPM",
                              fontSize: 17.sp,
                              color: Colors.black.withOpacity(.5),
                            ),
                            Container(
                              width: 130.w,
                              height: .5.h,
                              margin: EdgeInsets.symmetric(vertical: 4.h),
                              color: Colors.grey.withOpacity(.5),
                            ),
                            SizedBox(height: 4.h),
                            pressureRecord.note == ""
                                ? AppTitle(
                                    txt: "No Notes",
                                    fontSize: 13.sp,
                                    color: Colors.grey,
                                  )
                                : SizedBox(
                                    width: 240.w,
                                    child: AppTitle(
                                      txt: pressureRecord.note,
                                      color: Colors.black.withOpacity(.8),
                                      maxLine: 1,
                                    ),
                                  )
                          ],
                        ),
                        // const Text("p"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  SizedBox CountReading(Color color, int count) {
    return SizedBox(
      width: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 5.r,
            height: 5.r,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
          ),
          // SizedBox(width: 2.w),
          Text(count.toString(),
              style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.8))),
        ],
      ),
    );
  }
}
