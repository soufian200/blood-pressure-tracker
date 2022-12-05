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

class BloodPressureTab extends StatefulWidget {
  const BloodPressureTab({Key? key}) : super(key: key);

  @override
  State<BloodPressureTab> createState() => _BloodPressureTabState();
}

class _BloodPressureTabState extends State<BloodPressureTab> {
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      width: 70.w * 30,
                      height: 200.h,
                      child: const SysDiaBarChar()),
                ),
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
          Column(
            children: [
              const SysDiaRecord(),
              SizedBox(height: 10.h),
              const SysDiaRecord(),
              SizedBox(height: 10.h),
              const SysDiaRecord(),
              SizedBox(height: 10.h),
              const SysDiaRecord(),
              SizedBox(height: 10.h),
            ],
          ),
          SizedBox(height: 10.sp),
          AppButton(
            label: "See All History",
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
          print("Add blood pressure");
        },
      ),
    );
  }
}
