import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Generate Dropdown items
List<String> getMonthListItems() {
  List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> items = monthNames.map((mo) {
    return "${mo.substring(0, 3)} ${DateTime.now().year}";
  }).toList();
  return items;
}

List<String> items = getMonthListItems();

class MonthlyHead extends StatelessWidget {
  MonthlyHead(
      {Key? key, required this.selectedMonthIndex, required this.onChange})
      : super(key: key);
  int selectedMonthIndex;
  Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTitle(
          txt: "Monthly",
          fontSize: 25.sp,
          color: Colors.black.withOpacity(.5),
          // fontWeight: FontWeight.bold,
        ),
        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: DropdownButton(
            elevation: 1,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            underline: const SizedBox(),
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black.withOpacity(.7)),
            value: items[selectedMonthIndex],
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.withOpacity(.7),
            ),
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
