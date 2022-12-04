import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SysDiaRecord extends StatelessWidget {
  const SysDiaRecord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: SizedBox(
      height: 100.h,
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("50",
                    style: TextStyle(
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.8))),
                Text("52",
                    style: TextStyle(
                        fontSize: 42.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.8))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            width: 8.w,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("10:12 - 12/13/2022",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.primary)),
                  AppTitle(
                    txt: "Blood Pressure Tracker",
                    fontSize: 24.sp,
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 14.h),
                  AppTitle(
                    txt: "Pulse: 20 BPM",
                    fontSize: 17.sp,
                    color: Colors.black.withOpacity(.5),
                  ),
                ],
              ),
              // const Text("p"),
            ],
          )
        ],
      ),
    ));
  }
}
