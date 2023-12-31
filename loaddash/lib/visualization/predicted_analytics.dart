import 'dart:core';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/data.dart';
import 'package:loaddash/visualization/analytic_info_card.dart';

String title1 = '';
double count1 = 0.0;
IconData icon1 = Icons.abc_outlined;
Color color1 = Colors.white;
List<Data> data = [];

class PredictedAnalytics extends StatefulWidget {
  const PredictedAnalytics(
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
  _PredictedAnalyticsState createState() => _PredictedAnalyticsState();
}

class _PredictedAnalyticsState extends State<PredictedAnalytics> {
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
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getJsonFromAssets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return (Responsive(
              mobile: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width < 650 ? 2 : 4,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: size.width < 650 ? 2 : 1.5,
                  ),
                  itemBuilder: (context, index) {
                    double sc = 0;
                    double sg = 0;
                    int s = 0;
                    int e = 0;
                    String sd = DateFormat('yyyy-MM-dd').format(widget.sdate);
                    String ld = DateFormat('yyyy-MM-dd')
                        .format(widget.edate.add(const Duration(days: 1)));
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
                      Data a = data[i];
                      sc = sc + a.c;
                      sg = sg + a.g;
                    }
                    if (index == 0) {
                      title1 = "Actual Consumption";
                      count1 = sc;
                      icon1 = Icons.solar_power;
                      color1 = const Color(0xFFFFD5B0);
                    } else if (index == 1) {
                      title1 = "Predicted Consumption";
                      count1 = sg;
                      icon1 = Icons.house_sharp;
                      color1 = const Color(0xFFAB3A3A);
                    } else if (index == 2) {
                      title1 = "Actual Consumption";
                      count1 = sg;
                      icon1 = Icons.group_add;
                      color1 = const Color(0xFFFFDB12);
                    }
                    return AnalyticInfoCard(
                      title: title1,
                      count: count1,
                      icon: icon1,
                      color: color1,
                    );
                  }),
              tablet: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    double sc = 0;
                    double sg = 0;
                    int s = 0;
                    int e = 0;
                    String sd = DateFormat('yyyy-MM-dd').format(widget.sdate);
                    String ld = DateFormat('yyyy-MM-dd')
                        .format(widget.edate.add(const Duration(days: 1)));
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
                      Data a = data[i];
                      sc = sc + a.c;
                      sg = sg + a.g;
                    }
                    if (index == 0) {
                      title1 = "Actual Consumption";
                      count1 = sc;
                      icon1 = Icons.solar_power;
                      color1 = const Color(0xFFFFD5B0);
                    } else if (index == 1) {
                      title1 = "Predicted Consumption";
                      count1 = sg;
                      icon1 = Icons.house_sharp;
                      color1 = const Color(0xFFAB3A3A);
                    } else if (index == 2) {
                      title1 = "Actual Generation";
                      count1 = sc;
                      icon1 = Icons.group_add;
                      color1 = const Color(0xFFFFDB12);
                    }
                    return AnalyticInfoCard(
                      title: title1,
                      count: count1,
                      icon: icon1,
                      color: color1,
                    );
                  }),
              desktop: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
                  ),
                  itemBuilder: (context, index) {
                    double sc = 0;
                    double sg = 0;
                    int s = 0;
                    int e = 0;
                    String sd = DateFormat('yyyy-MM-dd').format(widget.sdate);
                    String ld = DateFormat('yyyy-MM-dd')
                        .format(widget.edate.add(const Duration(days: 1)));
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
                      Data a = data[i];
                      sc = sc + a.c;
                      sg = sg + a.g;
                    }
                    if (index == 0) {
                      title1 = "Actual Consumption";
                      count1 = sc;
                      icon1 = Icons.house_sharp;
                      color1 = const Color(0xFFFFD5B0);
                    } else if (index == 1) {
                      title1 = "Predicted Consumption";
                      count1 = sg;
                      icon1 = Icons.house_sharp;
                      color1 = const Color(0xFFAB3A3A);
                    } else if (index == 2) {
                      title1 = "Actual Generation";
                      count1 = sc;
                      icon1 = Icons.solar_power;
                      color1 = const Color(0xFFFFDB12);
                    }
                    return AnalyticInfoCard(
                      title: title1,
                      count: count1,
                      icon: icon1,
                      color: color1,
                    );
                  }),
            ));
          } else {
            return (const Center(child: CircularProgressIndicator()));
          }
        });
  }
}
