import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loaddash/data.dart';
import 'package:loaddash/style/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllHistoryGraph extends StatefulWidget {
  const AllHistoryGraph(
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
  _AllHistoryGraphState createState() => _AllHistoryGraphState();
}

class _AllHistoryGraphState extends State<AllHistoryGraph> {
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
              double s = 0;
              double t = 0;
              String sd = DateFormat('yyyy-MM-dd').format(widget.sdate);
              for (int i = 0; i < data.length; i++) {
                if (data[i].d != sd) {
                  s = s + data[i].c;
                  t = t + data[i].g;
                }
                if ((i + 1) % 48 == 0) {
                  cd.add(ChartData(dat: data[i].d, con: s, gen: t));
                  s = 0;
                  t = 0;
                }
                if (data[i].d == sd) {
                  break;
                }
              }
              return (SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  backgroundColor: AppColors.white,
                  legend: Legend(
                    position: LegendPosition.top,
                    isVisible: true,
                    offset: const Offset(20, 40),
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
