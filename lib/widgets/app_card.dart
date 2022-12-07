import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  AppCard({Key? key, required this.child, this.padding = 16}) : super(key: key);
  double padding;

  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: child);
  }
}
