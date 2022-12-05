import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulseRecord extends StatelessWidget {
  PulseRecord({
    Key? key,
    required this.date,
    required this.title,
    required this.pulse,
  }) : super(key: key);

  String date;
  String title;
  int pulse;

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: SizedBox(
      height: 60.h,
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 16.sp,
                      color: Colors.red,
                    ),
                    SizedBox(width: 1.w),
                    AppTitle(
                      txt: "BPM",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.8),
                    ),
                  ],
                ),
                AppTitle(
                  txt: pulse.toString(),
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.8),
                ),
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
                  Text(date,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.primary)),
                  AppTitle(
                    txt: title,
                    fontSize: 30.sp,
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.bold,
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
