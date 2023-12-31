import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/data.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class UserPie extends StatefulWidget {
  const UserPie(
      {super.key,
      required this.sdate,
      required this.edate,
      required this.label,
      required this.id,
      required this.view});

  final DateTime sdate;
  final DateTime edate;
  final String label;
  final String id;
  final String view;

  @override
  State<UserPie> createState() => _UserPieState();
}

class _UserPieState extends State<UserPie> {
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
    if (widget.label == 'Consumption') {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: 'Consumption Usage',
                color: AppColors.black,
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                    future: getJsonFromAssets(),
                    builder: (context, snapshot) {
                      double csum = 0;
                      double gsum = 0;
                      double per = 0;
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
                        csum = csum + data[i].c;
                      }
                      for (int j = (s - 48); j < (e - 48); j++) {
                        gsum = gsum + data[j].c;
                      }
                      per = (csum * 100) / gsum;
                      if (snapshot.hasData) {
                        return (SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              showTicks: false,
                              startAngle: 270,
                              endAngle: 270,
                              axisLineStyle: const AxisLineStyle(
                                thickness: 0.15,
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  positionFactor: 0.1,
                                  angle: 90,
                                  widget: Text(
                                    '${(per).toStringAsFixed(2)}%',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 36,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: per,
                                    width: 0.15,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    cornerStyle: CornerStyle.startCurve,
                                    gradient: const SweepGradient(
                                      colors: <Color>[
                                        Color(0xFFAB3A3A),
                                        Color(0xFFFFD5B0),
                                      ],
                                      stops: <double>[
                                        0.25,
                                        0.75,
                                      ],
                                    )),
                                MarkerPointer(
                                  value: per,
                                  markerHeight: 20,
                                  markerWidth: 20,
                                  markerType: MarkerType.circle,
                                  color: const Color(0xFFEC7E5D),
                                ),
                              ],
                            ),
                          ],
                        ));
                      } else {
                        return (const Center(
                            child: CircularProgressIndicator()));
                      }
                    }),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: 'Generation Usage',
                color: AppColors.black,
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                    future: getJsonFromAssets(),
                    builder: (context, snapshot) {
                      double csum = 0;
                      double gsum = 0;
                      double per = 0;
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
                        csum = csum + data[i].g;
                      }
                      for (int j = (s - 48); j < (e - 48); j++) {
                        gsum = gsum + data[j].g;
                      }
                      per = (csum * 100) / gsum;
                      if (snapshot.hasData) {
                        return (SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              showLabels: false,
                              showTicks: false,
                              startAngle: 270,
                              endAngle: 270,
                              axisLineStyle: const AxisLineStyle(
                                thickness: 0.15,
                                thicknessUnit: GaugeSizeUnit.factor,
                              ),
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  positionFactor: 0.1,
                                  angle: 90,
                                  widget: Text(
                                    '${(per).toStringAsFixed(2)}%',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 36,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: per,
                                    width: 0.15,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    cornerStyle: CornerStyle.startCurve,
                                    gradient: const SweepGradient(
                                      colors: <Color>[
                                        Color(0xFFDE9728),
                                        AppColors.secondary,
                                      ],
                                      stops: <double>[
                                        0.25,
                                        0.75,
                                      ],
                                    )),
                                MarkerPointer(
                                  value: per,
                                  markerHeight: 20,
                                  markerWidth: 20,
                                  markerType: MarkerType.circle,
                                  color: const Color(0xFFDE9728),
                                ),
                              ],
                            ),
                          ],
                        ));
                      } else {
                        return (const Center(
                            child: CircularProgressIndicator()));
                      }
                    }),
              ),
            ],
          ),
        ),
      );
    }
  }
}
