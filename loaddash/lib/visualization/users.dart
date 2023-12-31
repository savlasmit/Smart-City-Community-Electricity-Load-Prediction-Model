import 'package:flutter/material.dart';
import 'package:loaddash/visualization/bar_chart_users.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class Users extends StatefulWidget {
  const Users(
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
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    if (widget.label == 'Consumption') {
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
                text: 'Consumption Data',
                size: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
            Expanded(
              child: BarChartUsers(
                  sdate: widget.sdate,
                  edate: widget.edate,
                  label: widget.label,
                  id: widget.id,
                  view: widget.view),
            ),
          ],
        ),
      );
    } else {
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
                text: 'Generation Data',
                size: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.black),
            Expanded(
              child: BarChartUsers(
                  sdate: widget.sdate,
                  edate: widget.edate,
                  label: widget.label,
                  id: widget.id,
                  view: widget.view),
            ),
          ],
        ),
      );
    }
  }
}
