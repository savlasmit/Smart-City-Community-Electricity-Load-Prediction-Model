import 'package:flutter/material.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/visualization/all_history_graph.dart';
import 'package:loaddash/visualization/history_graph.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class HisGraph extends StatefulWidget {
  const HisGraph(
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
  _HisGraphState createState() => _HisGraphState();
}

class _HisGraphState extends State<HisGraph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              children: [
                const PrimaryText(
                  text: 'Historical Data',
                  color: AppColors.black,
                  size: 15,
                  fontWeight: FontWeight.w800,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Historical Data'),
                        content: Builder(builder: (context) {
                          return SizedBox(
                            height: 500,
                            width: 750,
                            child: AllHistoryGraph(
                                sdate: widget.sdate,
                                edate: widget.edate,
                                id: widget.id,
                                view: widget.view),
                          );
                        }),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              color: AppColors.primary,
                              padding: const EdgeInsets.all(16.0),
                              child: const PrimaryText(
                                text: 'Close',
                                size: 15,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.white),
                  ),
                  child: PrimaryText(
                    text: 'View All',
                    size: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            SizedBox(
              height: 300,
              child: HistoryGraph(
                  sdate: widget.sdate,
                  edate: widget.edate,
                  id: widget.id,
                  view: widget.view),
            ),
          ],
        ),
      ),
    );
  }
}
