import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.bg = AppColors.primary,
    this.height = 60,
    this.color = Colors.white,
  }) : super(key: key);

  String label;
  Function() onTap;
  Color bg;
  double height;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.black.withOpacity(.4),
          borderRadius: BorderRadius.circular(40.r),
          onTap: onTap,
          child: Ink(
            height: height * 1.h,
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
