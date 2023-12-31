import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:loaddash/data.dart';
import 'package:loaddash/style/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ErrorBarChart extends StatefulWidget {
  const ErrorBarChart(
      {super.key,
      required this.sdate,
      required this.edate,
      required this.id,
      required this.view});

  final DateTime sdate;
  final DateTime edate;
  final String id;
  final String view;
  @override
  // ignore: library_private_types_in_public_api
  _ErrorBarChartState createState() => _ErrorBarChartState();
}

class _ErrorBarChartState extends State<ErrorBarChart> {
  List<Data> data = [];
  Future<String> getJsonFromAssets() async {
    if (widget.view == 'House 1') {
      return await rootBundle.loadString('assets/House_1.json');
    } else if (widget.view == 'House 2') {
      return await rootBundle.loadString('assets/House_2.json');
    } else if (widget.view == 'House 3') {
      return await rootBundle.loadString('assets/House_3.json');
    } else {
      return await rootBundle.loadString('assets/House_1.json');
    }
  }

  Future loadJsonData() async {
    final String jsonString = await getJsonFromAssets();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      data.add(Data.fromJson(i));
    }
  }

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getJsonFromAssets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int s = 0;
              int e = 0;
              String sd = DateFormat('yyyy-MM-dd').format(widget.sdate);
              String ld = DateFormat('yyyy-MM-dd')
                  .format(widget.edate.add(const Duration(days: 1)));
              List<Data> a = [];
              for (int i = 0; i < data.length; i++) {
                if (sd == data[i].d) {
                  s = i;
                  break;
                }
              }
              for (int i = 0; i < data.length; i++) {
                if (ld == data[i].d) {
                  e = i;
                  break;
                }
              }
              for (int i = s; i < e; i++) {
                a.add(data[i]);
              }
              return (SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  backgroundColor: AppColors.white,
                  legend: Legend(
                    position: LegendPosition.top,
                    isVisible: true,
                    offset: const Offset(20, 0),
                  ),
                  enableSideBySideSeriesPlacement: false,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  series: <ChartSeries<Data, String>>[
                    ErrorBarSeries<Data, String>(
                      dataSource: a,
                      color: AppColors.third,
                      xValueMapper: (Data data, _) => data.dt,
                      yValueMapper: (Data data, _) =>
                          (data.c - data.pred).abs(),
                    ),
                  ]));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
