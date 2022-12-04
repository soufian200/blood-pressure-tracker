import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  Label({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.number,
    this.numberColor = Colors.orange,
  }) : super(key: key);

  String title;
  String subtitle;
  int number;
  Color numberColor;

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
        Text(
          number.toString(),
          style: TextStyle(fontSize: 50.sp, color: numberColor),
        ),
      ],
    );
  }
}
