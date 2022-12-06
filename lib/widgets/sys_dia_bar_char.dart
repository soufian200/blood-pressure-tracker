import 'package:bptracker/Methods/app_bar_char_rod_data.dart';
import 'package:bptracker/models/sys_dia_stats.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SysDiaBarChar extends StatelessWidget {
  // List<charts.Series> seriesList;

  SysDiaBarChar();

  List<SysDiaStats> systolicData = [
    SysDiaStats('01/23', 53, 70),
    SysDiaStats('02/23', 51, 75),
    SysDiaStats('03/23', 51, 80),
    SysDiaStats('04/23', 51, 90),
    SysDiaStats('05/23', 51, 30),
    SysDiaStats('06/23', 51, 70),
    SysDiaStats('07/23', 51, 70),
    SysDiaStats('08/23', 51, 70),
    SysDiaStats('09/23', 51, 70),
    SysDiaStats('10/23', 51, 70),
    SysDiaStats('11/23', 51, 70),
    SysDiaStats('12/23', 51, 70),
    SysDiaStats('13/23', 51, 70),
    SysDiaStats('14/23', 51, 70),
    SysDiaStats('14/23', 120, 80),
    SysDiaStats('14/23', 51, 70),
    SysDiaStats('15/23', 51, 70),
    SysDiaStats('16/23', 51, 70),
    SysDiaStats('17/23', 51, 70),
    SysDiaStats('18/23', 51, 70),
    SysDiaStats('19/23', 51, 70),
    SysDiaStats('20/23', 51, 70),
    SysDiaStats('21/23', 51, 70),
    SysDiaStats('22/23', 51, 70),
    SysDiaStats('23/23', 51, 70),
    SysDiaStats('24/23', 51, 70),
    SysDiaStats('25/23', 51, 70),
    SysDiaStats('26/23', 51, 70),
    SysDiaStats('27/23', 51, 70),
    SysDiaStats('28/23', 51, 70),
    SysDiaStats('29/23', 51, 70),
    SysDiaStats('30/23', 51, 70),
    SysDiaStats('31/23', 51, 70),
  ];

  int xIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(5.r),
          width: 70.w * systolicData.length,
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
                          systolicData[value.toInt()].date,
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
                ...systolicData.map((SysDiaStats data) {
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
    );
  }
}
