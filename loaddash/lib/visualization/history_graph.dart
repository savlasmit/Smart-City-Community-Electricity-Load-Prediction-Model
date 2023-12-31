import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loaddash/data.dart';
import 'package:loaddash/style/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryGraph extends StatefulWidget {
  const HistoryGraph(
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
  _HistoryGraphState createState() => _HistoryGraphState();
}

class _HistoryGraphState extends State<HistoryGraph> {
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
              List<ChartData> cd = [];
              for (int i = 1; i < 6; i++) {
                double s = 0;
                double t = 0;
                String sd = DateFormat('yyyy-MM-dd')
                    .format(widget.sdate.subtract(Duration(days: i)));
                for (int j = 0; j < data.length; j++) {
                  if (sd == data[j].d) {
                    Data a = data[j];
                    s = s + a.c;
                    t = t + a.g;
                  }
                }
                cd.add(ChartData(dat: sd, con: s, gen: t));
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
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      name: 'Consumption',
                      dataSource: cd,
                      color: AppColors.third,
                      xValueMapper: (ChartData data, _) => data.dat,
                      yValueMapper: (ChartData data, _) => data.con,
                    ),
                    ColumnSeries<ChartData, String>(
                      name: 'Generation',
                      dataSource: cd,
                      color: const Color(0xFFDE9728),
                      xValueMapper: (ChartData data, _) => data.dat,
                      yValueMapper: (ChartData data, _) => data.gen,
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
