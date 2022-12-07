import 'package:bptracker/Methods/get_sys_dia_status.dart';
import 'package:bptracker/models/bp_status.dart';
import 'package:bptracker/models/pressure_record_model.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_button.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SysDiaRecord extends StatelessWidget {
  SysDiaRecord({Key? key, required this.pressureRecord}) : super(key: key);

  PressureRecordModel pressureRecord;

  ///

  @override
  Widget build(BuildContext context) {
    BPStatus bpStatus = getSysDiaStatus(pressureRecord.sys, pressureRecord.dia);
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.black.withOpacity(.4),
        borderRadius: BorderRadius.circular(40.r),
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                    height: 600.h,
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      children: [
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
                            Expanded(
                              child: AppButton(
                                  label: "Edit",
                                  bg: Colors.blue,
                                  onTap: () {
                                    print("edit");
                                  }),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: AppButton(
                                  label: "Delete",
                                  bg: Colors.red,
                                  onTap: () {
                                    print("delete");
                                  }),
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
