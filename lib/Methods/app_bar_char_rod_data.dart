import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BarChartRodData AppBarCharRodData(yVal, color) {
  return BarChartRodData(
      toY: yVal,
      width: 18.w,
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(2.r),
        topRight: Radius.circular(2.r),
      ));
}
