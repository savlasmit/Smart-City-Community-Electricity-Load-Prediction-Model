import 'package:flutter/material.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';
import 'package:loaddash/visualization/spline_area_chart.dart';

class UsersP extends StatefulWidget {
  const UsersP(
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
  State<UsersP> createState() => _UsersPState();
}

class _UsersPState extends State<UsersP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryText(
              text: 'Actual vs Predicted Consumption',
              size: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.black),
          Expanded(
            child: SplineAreaChart(
                sdate: widget.sdate,
                edate: widget.edate,
                id: widget.id,
                view: widget.view),
          ),
        ],
      ),
    );
  }
}
