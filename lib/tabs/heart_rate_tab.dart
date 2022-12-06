import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_button.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:bptracker/widgets/label.dart';
import 'package:bptracker/widgets/publse_bar_char.dart';
import 'package:bptracker/widgets/pulse_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartRateTab extends StatefulWidget {
  const HeartRateTab({Key? key}) : super(key: key);

  @override
  State<HeartRateTab> createState() => _HeartRateTabState();
}

class _HeartRateTabState extends State<HeartRateTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(
        child: Column(children: [
          SizedBox(height: 20.sp),
          AppCard(
            child: Column(children: [
              Label(
                title: "Average",
                subtitle: "BMP",
                number: 55,
              ),
              SizedBox(height: 17.h),
              Label(
                title: "Max",
                subtitle: "BMP",
                number: 55,
                numberColor: Colors.blueAccent,
              ),
              SizedBox(height: 17.h),
              Label(
                title: "Min",
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
                PulseBarChar(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.r,
                          height: 10.r,
                          color: AppColors.pulse,
                        ),
                        SizedBox(width: 5.w),
                        const Text("Pulse")
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
              PulseRecord(
                date: "10:12 - 12/13/2022",
                title: "Normal",
                pulse: 54,
              ),
              SizedBox(height: 10.h),
              PulseRecord(
                date: "10:12 - 11/13/2022",
                title: "normal",
                pulse: 52,
              ),
              SizedBox(height: 10.h),
              PulseRecord(
                date: "10:12 - 12/03/2022",
                title: "normal",
                pulse: 62,
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          AppButton(
            label: "See All History",
            onTap: () {
              print("See all history...");
            },
          ),
          SizedBox(height: 100.sp),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          size: 25.sp,
        ),
        onPressed: () {
          print("Add Heart Rate");
        },
      ),
    );
  }
}
