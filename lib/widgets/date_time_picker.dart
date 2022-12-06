import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimePicker extends StatelessWidget {
  DateTimePicker(
      {Key? key,
      required this.date,
      required this.onDateChanged,
      required this.onTimeChanged,
      required this.time})
      : super(key: key);
  DateTime date;
  Function(DateTime date) onDateChanged;
  Function(TimeOfDay date) onTimeChanged;
  TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppTitle(
              txt: "Date & Time",
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.7),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(20.r),
                onTap: () async {
                  // print("day");
                  DateTime? r = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2200));

                  if (r != null) {
                    onDateChanged(r);
                  }
                },
                child: Ink(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.black.withOpacity(.8),
                        ),
                        SizedBox(width: 6.w),
                        AppTitle(
                          txt: "${date.day}/${date.month}/${date.year}",
                          fontSize: 22.sp,
                          color: Colors.black.withOpacity(.5),
                        )
                      ]),
                )),
            SizedBox(width: 20.w),
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(20.r),
                onTap: () async {
                  TimeOfDay? r =
                      await showTimePicker(context: context, initialTime: time);

                  if (r != null) {
                    onTimeChanged(r);
                  }
                  print(r);
                },
                child: Ink(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.black.withOpacity(.8),
                        ),
                        SizedBox(width: 6.w),
                        AppTitle(
                          txt: "${time.hour}:${time.minute}",
                          fontSize: 22.sp,
                          color: Colors.black.withOpacity(.5),
                        )
                      ]),
                ))
          ],
        ),
      ],
    );
  }
}
