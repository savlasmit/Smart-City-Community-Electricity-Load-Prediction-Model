import 'package:flutter/material.dart';
import 'package:loaddash/component/map_view.dart';
import 'package:loaddash/config/size_config.dart';
// import 'package:loaddash/visualization/his_graph.dart';

class RightMenu extends StatefulWidget {
  const RightMenu(
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
  _RightMenuState createState() => _RightMenuState();
}

class _RightMenuState extends State<RightMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical * 3,
      ),
      MapView(id: widget.id, view: widget.view),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
      ),
      // HisGraph(sdate: widget.sdate, edate: widget.edate),
    ]);
  }
}
