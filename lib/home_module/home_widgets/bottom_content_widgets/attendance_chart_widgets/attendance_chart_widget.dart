import 'package:asset_management_dashboard/home_module/home_widgets/bottom_content_widgets/attendance_chart_widgets/attendance_chart_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../riverpod_providers/state_providers.dart';
import '../../../home_models/attendance_chart_model.dart';

class AttendanceChartWidget extends StatelessWidget {
  AttendanceChartWidget({super.key});

  final List<AttendanceChartModel> graphData = [
    AttendanceChartModel(x: 'Mon', y1: 230, y2: 550, y3: 800),
    AttendanceChartModel(x: 'Tue', y1: 350, y2: 650, y3: 1000),
    AttendanceChartModel(x: 'Wed', y1: 210, y2: 410, y3: 600),
    AttendanceChartModel(x: 'Thu', y1: 250, y2: 600, y3: 860),
    AttendanceChartModel(x: 'Fri', y1: 230, y2: 430, y3: 600),
    AttendanceChartModel(x: 'Sat', y1: 340, y2: 650, y3: 950),
    AttendanceChartModel(x: 'Sun', y1: 280, y2: 550, y3: 800),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final appTheme = ref.watch(appThemeProvider);
        return SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          legend: const Legend(
            isVisible: true,
            alignment: ChartAlignment.far,
            // Border color and border width of legend
          ),
          series: <CartesianSeries>[
            StackedColumnSeries<AttendanceChartModel, String>(
              legendItemText: "Absent",
              color: AttendanceChartThemes(appThemeType: appTheme).giveAbsentColor(),
              dataSource: graphData,
              xValueMapper: (AttendanceChartModel data, _) => data.x,
              yValueMapper: (AttendanceChartModel data, _) => data.y1,
            ),
            StackedColumnSeries<AttendanceChartModel, String>(
              legendItemText: "On-time",
              color: AttendanceChartThemes(appThemeType: appTheme).giveOnTimeColor(),
              dataSource: graphData,
              xValueMapper: (AttendanceChartModel data, _) => data.x,
              yValueMapper: (AttendanceChartModel data, _) => data.y2,
            ),
            StackedColumnSeries<AttendanceChartModel, String>(
              legendItemText: "Late",
              color: AttendanceChartThemes(appThemeType: appTheme).giveLateColor(),
              dataSource: graphData,
              xValueMapper: (AttendanceChartModel data, _) => data.x,
              yValueMapper: (AttendanceChartModel data, _) => data.y3,
            ),
          ],
        );
      },
    );
  }
}
