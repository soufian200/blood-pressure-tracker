import 'package:bptracker/models/sys_dia_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PulseBarChar extends StatelessWidget {
  // List<charts.Series> seriesList;

  const PulseBarChar();

  /// Create series list with multiple series
  static List<charts.Series<SysDiaStats, String>> _createSampleData() {
    final pulseData = [
      SysDiaStats('01/23', 53),
      SysDiaStats('02/23', 51),
      SysDiaStats('03/23', 51),
      SysDiaStats('04/23', 51),
      SysDiaStats('05/23', 51),
      SysDiaStats('06/23', 51),
      SysDiaStats('07/23', 51),
      SysDiaStats('08/23', 51),
      SysDiaStats('09/23', 51),
      SysDiaStats('10/23', 51),
      SysDiaStats('11/23', 51),
      SysDiaStats('12/23', 51),
      SysDiaStats('13/23', 51),
      SysDiaStats('14/23', 51),
      SysDiaStats('15/23', 51),
      SysDiaStats('16/23', 51),
      SysDiaStats('17/23', 51),
      SysDiaStats('18/23', 51),
      SysDiaStats('19/23', 51),
      SysDiaStats('20/23', 51),
      SysDiaStats('21/23', 51),
      SysDiaStats('22/23', 51),
      SysDiaStats('23/23', 51),
      SysDiaStats('24/23', 51),
      SysDiaStats('25/23', 51),
      SysDiaStats('26/23', 51),
      SysDiaStats('27/23', 51),
      SysDiaStats('28/23', 51),
      SysDiaStats('29/23', 51),
      SysDiaStats('30/23', 51),
      SysDiaStats('31/23', 51),
    ];

    return [
      // Blue bars with a lighter center color.
      charts.Series<SysDiaStats, String>(
        id: 'Systolic',
        domainFn: (SysDiaStats data, _) => data.date,
        measureFn: (SysDiaStats data, _) => data.count,
        data: pulseData,
        colorFn: (_, __) => const charts.Color(r: 14, g: 103, b: 219),
        // fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSampleData(),
      animate: true,

      // Configure a stroke width to enable borders on the bars.
      defaultRenderer: charts.BarRendererConfig(
        maxBarWidthPx: 20,
        groupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}
