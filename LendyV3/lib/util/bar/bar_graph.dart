import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lendyv1/util/bar/bar_data_inv.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({
    super.key,
    required this.weeklySummary,
  });
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tueAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[5],
    );
    myBarData.intialzeBarData();
    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      barGroups: myBarData.barData
          .map(
            (e) => BarChartGroupData(
              x: e.x,
              barRods: [
                BarChartRodData(
                    toY: e.y,
                    width: 15,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.white38,
                    )),
              ],
            ),
          )
          .toList(),
    ));
  }
}
