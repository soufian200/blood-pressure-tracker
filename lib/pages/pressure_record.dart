import 'dart:convert';

import 'package:bptracker/Methods/get_sys_dia_status.dart';
import 'package:bptracker/models/bp_status.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_button.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:bptracker/widgets/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureRecord extends StatefulWidget {
  const PressureRecord({Key? key}) : super(key: key);

  @override
  State<PressureRecord> createState() => _PressureRecordState();
}

class _PressureRecordState extends State<PressureRecord> {
  ///
  int _sysVal = 70;
  int _diaVal = 40;
  int _pulseVal = 20;
  DateTime _date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay _time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  final TextEditingController _noteController = TextEditingController();

  BPStatus _crrbpStatus = getSysDiaStatus(70, 40);

  ///
  void updatePulseVal() {
    // return;
    int df = _sysVal - _diaVal;
    if (df > 20) {
      _pulseVal = df;
    }
  }

  ///
  void observeCrrStatus() {
    setState(() {
      _crrbpStatus = getSysDiaStatus(_sysVal, _diaVal);
    });
  }

  ///
  void _onDateChanged(newDate) {
    setState(() {
      _date = newDate;
    });
  }

  ///
  void _onTimeChanged(newDate) {
    setState(() {
      _time = newDate;
    });
  }

  ///
  void savePressureRecord() async {
    String dateTimeStr =
        "${_date.day}/${_date.month}/${_date.year} - ${_time.hour}:${_time.minute}";
    String y = DateTime.now().year.toString();
    String mo = DateTime.now().month.toString();
    Map dayContext = {
      "sys": _sysVal,
      "dia": _diaVal,
      "pulse": _pulseVal,
      "note": _noteController.text,
      "date_time_str": dateTimeStr,
      "date_time": {
        "year": _date.year,
        "month": _date.month,
        "day": _date.day,
        "hour": _time.hour,
        "min": _time.minute,
      },
    };
    Map context = {
      mo: {dateTimeStr: dayContext}
    };

    print("=================");

    /// Store in Local Storage
    final prefs = await SharedPreferences.getInstance();

    String? yData = prefs.getString(y);
    if (yData != null) {
      Map yDataDecoded = json.decode(yData);
      Map mData = yDataDecoded[mo];
      mData[dateTimeStr] = dayContext;
      yDataDecoded[mo] = mData;

      String newEncodedContext = json.encode(yDataDecoded);
      // print(newEncodedContext);
      prefs.setString(y, newEncodedContext);
    } else {
      String encodedContext = json.encode(context);
      prefs.setString(y, encodedContext);
    }
    // print(encodedContext);

    /// Return Back
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(6.r),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(40.r),
            onTap: () {
              Get.back();
            },
            child: Ink(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
              child: Icon(
                Icons.close,
                size: 40.sp,
                color: Colors.black.withOpacity(.6),
              ),
            ),
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Pressure Record",
          style: TextStyle(fontSize: 28.sp, color: AppColors.primary),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.r, horizontal: 6.w),
            child: Row(
              children: [
                SizedBox(
                    width: 90.w,
                    child: AppButton(
                      label: "Save",
                      onTap: savePressureRecord,
                    )),
              ],
            ),
          )
        ],
      ),
      body: AppContainer(
          child: Column(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 200.sp, color: _crrbpStatus.color),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 22.w),
                decoration: BoxDecoration(
                    color: _crrbpStatus.color,
                    borderRadius: BorderRadius.all(Radius.circular(18.r))),
                child: AppTitle(
                  txt: _crrbpStatus.label,
                  maxLine: 2,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: _crrbpStatus.color == AppColors.elevated
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ],
          ),
          SizedBox(height: 15.h),
          AppTitle(
            txt: _crrbpStatus.msg,
            fontSize: 25.sp,
            color: Colors.black.withOpacity(.6),
          ),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///
              Column(
                children: [
                  AppTitle(
                    txt: "Systolic",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.7),
                  ),
                  AppTitle(
                    txt: "( mmHg )",
                    fontSize: 19.sp,
                    color: Colors.black.withOpacity(.5),
                  ),
                  Container(
                    width: 105.w,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: NumberPicker(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                        bottom: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                      )),
                      value: _sysVal,
                      minValue: 20,
                      maxValue: 200,
                      selectedTextStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black.withOpacity(.2)),
                      onChanged: (value) => setState(() {
                        _sysVal = value;
                        observeCrrStatus();
                        // updatePulseVal();
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w),

              ///
              Column(
                children: [
                  AppTitle(
                    txt: "Diastolic",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.7),
                  ),
                  AppTitle(
                    txt: "( mmHg )",
                    fontSize: 19.sp,
                    color: Colors.black.withOpacity(.5),
                  ),
                  Container(
                    width: 105.w,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: NumberPicker(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                        bottom: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                      )),
                      value: _diaVal,
                      minValue: 20,
                      maxValue: 200,
                      selectedTextStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black.withOpacity(.2)),
                      onChanged: (value) => setState(() {
                        _diaVal = value;
                        observeCrrStatus();
                        // updatePulseVal();
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w),

              ///
              Column(
                children: [
                  AppTitle(
                    txt: "Pulse",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.7),
                  ),
                  AppTitle(
                    txt: "( BMP )",
                    fontSize: 19.sp,
                    color: Colors.black.withOpacity(.5),
                  ),
                  Container(
                    width: 105.w,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: NumberPicker(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                        bottom: BorderSide(
                            color: Colors.black.withOpacity(.5), width: 1.h),
                      )),
                      value: _pulseVal,
                      minValue: 20,
                      maxValue: 200,
                      selectedTextStyle: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black.withOpacity(.2)),
                      onChanged: (value) => setState(() => _pulseVal = value),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          DateTimePicker(
            date: _date,
            onDateChanged: _onDateChanged,
            time: _time,
            onTimeChanged: _onTimeChanged,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              AppTitle(
                txt: "Note",
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.7),
              ),
              SizedBox(width: 5.w),
              AppTitle(
                txt: "(optional)",
                fontSize: 13.sp,
                // fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.5),
              ),
            ],
          ),
          SizedBox(height: 10.h),

          ///
          TextFormField(
            controller: _noteController,
            textInputAction: TextInputAction.done,
            enableSuggestions: false,
            autocorrect: false,
            maxLines: 2,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                focusColor: AppColors.primary,
                hintText: 'Write a Note'),
          ),
          SizedBox(height: 30.h),
        ],
      )),
    );
  }
}
