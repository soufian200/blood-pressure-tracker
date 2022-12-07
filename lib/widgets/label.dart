import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  Label({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.stats,
    this.color = Colors.orange,
  }) : super(key: key);

  String title;
  String subtitle;
  Map<String, int> stats;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.h),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 30.sp, color: Colors.black.withOpacity(.74)),
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 15.sp, color: Colors.black.withOpacity(.5)),
              ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 60.w,
              child: Center(
                child: Text(
                  stats['max'].toString(),
                  style: TextStyle(
                      fontSize: 34.sp,
                      color: color,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: 15.w),
            SizedBox(
              // color: Colors.red,
              width: 60.w,
              child: Center(
                child: Text(
                  stats["min"].toString(),
                  style: TextStyle(
                      fontSize: 34.sp,
                      color: color,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
