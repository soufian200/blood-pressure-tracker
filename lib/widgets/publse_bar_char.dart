import 'package:bptracker/Methods/app_bar_char_rod_data.dart';
import 'package:bptracker/models/pulse_stat.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulseBarChar extends StatelessWidget {
  // List<charts.Series> seriesList;

  PulseBarChar();

  List<PulseStat> pulseData = [
    PulseStat('01/23', 53),
    PulseStat('02/23', 51),
    PulseStat('03/23', 51),
    PulseStat('04/23', 51),
    PulseStat('05/23', 51),
    PulseStat('06/23', 51),
    PulseStat('07/23', 51),
    PulseStat('08/23', 51),
    PulseStat('09/23', 51),
    PulseStat('10/23', 51),
    PulseStat('11/23', 51),
    PulseStat('12/23', 51),
    PulseStat('13/23', 51),
    PulseStat('14/23', 51),
    PulseStat('14/23', 120),
    PulseStat('14/23', 51),
    PulseStat('15/23', 51),
    PulseStat('16/23', 51),
    PulseStat('17/23', 51),
    PulseStat('18/23', 51),
    PulseStat('19/23', 51),
    PulseStat('20/23', 51),
    PulseStat('21/23', 51),
    PulseStat('22/23', 51),
    PulseStat('23/23', 51),
    PulseStat('24/23', 51),
    PulseStat('25/23', 51),
    PulseStat('26/23', 51),
    PulseStat('27/23', 51),
    PulseStat('28/23', 51),
    PulseStat('29/23', 51),
    PulseStat('30/23', 51),
    PulseStat('31/23', 51),
  ];

  int xIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(7.r),
          width: 55.w * pulseData.length,
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
                          pulseData[value.toInt()].date,
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
                ...pulseData.map((PulseStat data) {
                  return BarChartGroupData(
                    showingTooltipIndicators: [0, 1],
                    x: xIndex++,
                    barRods: [
                      AppBarCharRodData(data.count.toDouble(), AppColors.pulse),
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
