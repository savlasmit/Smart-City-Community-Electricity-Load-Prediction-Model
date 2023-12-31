import 'package:flutter/material.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/visualization/weather_cards.dart';
import 'package:loaddash/visualization/spline_chart.dart';
import 'package:loaddash/visualization/user_pie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(
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
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          child: WeatherCards(
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
                child: SplineChart(
                  sdate: widget.sdate,
                  edate: widget.edate,
                  id: widget.id,
                  view: widget.view,
                ),
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
                child: UserPie(
                    sdate: widget.sdate,
                    edate: widget.edate,
                    label: 'Consumption',
                    id: widget.id,
                    view: widget.view),
              ),
            if (!Responsive.isMobile(context))
              SizedBox(width: SizeConfig.blockSizeHorizontal * 2),
            Expanded(
              flex: 3,
              child: UserPie(
                  sdate: widget.sdate,
                  edate: widget.edate,
                  label: 'Generation',
                  id: widget.id,
                  view: widget.view),
            ),
          ],
        ),
      ],
    );
  }
}
