import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.label,
    this.bg = AppColors.primary,
    this.color = Colors.white,
  }) : super(key: key);

  String label;
  Color bg;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.black.withOpacity(.4),
          borderRadius: BorderRadius.circular(40.r),
          onTap: () {
            print("hello");
          },
          child: Ink(
            height: 60.h,
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(40.r)),
            child: Center(
                child: AppTitle(
              txt: label,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: color,
            )),
          )),
    );
  }
}
