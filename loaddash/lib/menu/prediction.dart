import 'package:flutter/material.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';
import 'package:loaddash/visualization/error_bar_chart.dart';
import 'package:loaddash/visualization/predicted_analytics.dart';
import 'package:loaddash/visualization/users_p.dart';

class Prediction extends StatefulWidget {
  const Prediction(
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
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          child: PredictedAnalytics(
              sdate: widget.sdate,
              edate: widget.edate,
              id: widget.id,
              view: widget.view),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 3,
                child: UsersP(
                    sdate: widget.sdate,
                    edate: widget.edate,
                    id: widget.id,
                    view: widget.view),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            PrimaryText(
                              text: 'Error between actual and predicted',
                              color: AppColors.black,
                              size: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        SizedBox(
                          height: 300,
                          child: ErrorBarChart(
                              sdate: widget.sdate,
                              edate: widget.edate,
                              id: widget.id,
                              view: widget.view),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
