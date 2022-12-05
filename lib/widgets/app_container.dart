import 'package:bptracker/widgets/scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppContainer extends StatelessWidget {
  AppContainer({Key? key, required this.child}) : super(key: key);
  Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ScrollGlow(
            child: SingleChildScrollView(
                child: Container(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(.05)),
                    child: child))));
  }
}
