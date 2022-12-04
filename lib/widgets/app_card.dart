import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  AppCard({Key? key, required this.child}) : super(key: key);

  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: child,
        ));
  }
}
