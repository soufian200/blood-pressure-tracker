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
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class BloodPressureTab extends StatefulWidget {
  const BloodPressureTab({Key? key}) : super(key: key);

  @override
  State<BloodPressureTab> createState() => _BloodPressureTabState();
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: Icon(
        widget.isSelected ? Icons.face_retouching_natural : Icons.face,
        color: widget.color,
        size: 28,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 1.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}

class _BloodPressureTabState extends State<BloodPressureTab> {
  ///
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    Set keys = prefs.getKeys();
    print("Keys: ${keys.toList()}");
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

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
                ///

                SysDiaBarChar(),

                // SysDiaBarChar(),
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
            onTap: () {
              print("See all history");
            },
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
          Get.toNamed("/pressure_record");
        },
      ),
    );
  }
}
