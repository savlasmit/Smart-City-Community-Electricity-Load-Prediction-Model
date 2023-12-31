import 'package:flutter/material.dart';
import 'package:loaddash/component/side_menu.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/style/colors.dart';

class Models extends StatefulWidget {
  const Models({super.key, required this.id, required this.view});

  final String id;
  final String view;

  @override
  State<Models> createState() => _ModelsState();
}

class _ModelsState extends State<Models> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
          width: 200,
          child: SideMenu(id: widget.id, lbl: 'Model', view: widget.view)),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SideMenu(id: widget.id, lbl: 'Model', view: widget.view),
              ),
          ],
        ),
      ),
    );
  }
}
