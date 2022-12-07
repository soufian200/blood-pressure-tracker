import 'package:bptracker/Methods/app_bar_char_rod_data.dart';
import 'package:bptracker/models/sys_dia_stats.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SysDiaBarChar extends StatelessWidget {
  // List<charts.Series> seriesList;

  SysDiaBarChar({Key? key, required this.data}) : super(key: key);

  List<SysDiaStats> data;

  int xIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 334.w),
          child: Container(
            padding: EdgeInsets.all(5.r),
            width: 70.w * data.length,
            height: 200.h,
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    fitInsideHorizontally: true,
                    tooltipBgColor: Colors.transparent,
                    tooltipPadding: EdgeInsets.zero,
                    tooltipMargin: 1.h,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.toY.round().toString(),
                        TextStyle(
                          color: rod.color,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                alignment: BarChartAlignment.spaceBetween,
                borderData: FlBorderData(
                  show: true,
                  border: const Border.symmetric(
                    horizontal: BorderSide(
                      color: Color(0xFFececec),
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    drawBehindEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 34.w,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: Color(0xFF606060),
                          ),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.h,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Container(
                              child: Text(
                            data[value.toInt()].date,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black.withOpacity(.7)),
                          )),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFececec),
                    strokeWidth: 1.h,
                  ),
                ),
                barGroups: [
                  ...data.map((SysDiaStats data) {
                    return BarChartGroupData(
                      showingTooltipIndicators: [0, 1],
                      x: xIndex++,
                      barRods: [
                        AppBarCharRodData(
                            data.sys.toDouble(), AppColors.systolic),
                        AppBarCharRodData(
                            data.dia.toDouble(), AppColors.diastolic),
                      ],
                    );
                  })
                ],
                maxY: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
