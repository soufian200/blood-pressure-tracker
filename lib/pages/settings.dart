import 'dart:convert';
import 'dart:io';

import 'package:bptracker/Methods/get_sys_dia_status.dart';
import 'package:bptracker/utils/Dialogs.dart';
import 'package:bptracker/utils/Permissions.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/excel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:get/route_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  /// Export as excel File
  void _exportAsFile() async {
    /* Your blah blah code here */

    ByteData data = await rootBundle.load("assets/blood_pressure_file.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    print(excel.tables.keys);

    String sheet1Name = excel.tables.keys.toList()[0];
    Sheet? sheet1 = excel.tables[sheet1Name];
    if (sheet1 == null) {
      print("No Sheet...");
      return;
    }
    print("===============");
    // Data cell =
    //     sheet1.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1));
    // cell.value = "hellow world";
    // Data cell2 =
    //     sheet1.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1));
    // cell.value = "hellow world 2";
    int rowIndex = 1;
    final prefs = await SharedPreferences.getInstance();
    prefs.getKeys();
    for (String year in prefs.getKeys()) {
      Map months = json.decode(prefs.getString(year) ?? "");
      for (Map month in months.values) {
        for (Map day in month.values) {
          ///
          Data cell = sheet1.cell(
              CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex));
          cell.value = day["date_time_str"];

          ///
          Data cell2 = sheet1.cell(
              CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex));
          cell2.value = day["sys"];

          ///
          Data cell3 = sheet1.cell(
              CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex));
          cell3.value = day["dia"];

          ///
          Data cell4 = sheet1.cell(
              CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex));
          cell4.value = day["pulse"];

          ///
          Data cell5 = sheet1.cell(
              CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex));
          cell5.value = getSysDiaStatus(day["sys"], day["dia"]).label;
        }
        rowIndex++;
      }
    }

    print("ff");
    bool isYes = await Permissions.requestStorage();
    if (!isYes) {
      Dialogs.showOkAlertDialog(
          "Warning", "Please Allow Storage To Save This File");
      return;
    }
    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();
    DateTime today = DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    File("/storage/emulated/0/Download/Pressure_Blood_Tracker-$dateSlug.xlsx")
        .writeAsBytesSync(fileBytes!);
    print("Exported in /Download .....");
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      backgroundColor: Colors.black.withOpacity(.7),
      content: const Text('Exported Successfully at /Download'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 78.h,
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 32.sp, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
        body: AppContainer(
            child: Column(children: [
          AppCard(
              child: Column(
            children: [
              PressableLi(
                label: "Export as File",
                icon: Icons.insert_drive_file,
                onTap: _exportAsFile,
              ),
              SizedBox(height: 10.h),
              PressableLi(
                label: "Rate Us",
                icon: Icons.star,
                onTap: () {
                  print("jo");
                },
              ),
              SizedBox(height: 10.h),
              PressableLi(
                label: "Check Updates",
                icon: Icons.tips_and_updates,
                onTap: () {
                  print("jo");
                },
              ),
            ],
          ))
        ])));
  }
}

class PressableLi extends StatelessWidget {
  PressableLi({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  String label;
  IconData icon;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10.r),
          onTap: onTap,
          child: Ink(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              width: 1.sw,
              height: 50.h,
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 40.sp,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10.w),
                  AppTitle(
                    txt: label,
                    fontSize: 22.sp,
                    color: Colors.black.withOpacity(.7),
                  ),
                ],
              ))),
    );
  }
}
