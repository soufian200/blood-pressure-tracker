import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  /// Export as excel File
  void _exportAsFile() async {
    /* Your blah blah code here */

    ByteData data = await rootBundle.load("assets/blood_pressure_file.xlsx");
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // var excel = .decodeBytes(bytes, update: true);

    // for (var table in excel.tables.keys) {
    //   print(table); //sheet Name
    //   print(excel.tables[table].maxCols);
    //   print(excel.tables[table].maxRows);
    //   for (var row in excel.tables[table].rows) {
    //     print("$row");
    //   }
    // }

    print("ff");
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
                  )
                ],
              ))),
    );
  }
}
