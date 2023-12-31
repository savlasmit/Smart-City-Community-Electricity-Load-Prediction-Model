import 'package:flutter/material.dart';
import 'package:loaddash/component/side_menu.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class Teams extends StatefulWidget {
  const Teams({super.key, required this.id, required this.view});

  final String id;
  final String view;

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
          width: 200,
          child: SideMenu(id: widget.id, lbl: 'Team', view: widget.view)),
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
                child: SideMenu(id: widget.id, lbl: 'Team', view: widget.view),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const PrimaryText(
                                  text: 'Our Team',
                                  size: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical,
                                ),
                                const PrimaryText(
                                  text: '- Students of SJSU',
                                  color: AppColors.iconGray,
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      //  Teams Details here
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.primary,
                                      AppColors.white,
                                    ],
                                    stops: [0.4, 0.6],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  border: Border.all(
                                      color: AppColors.third, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        width: 200,
                                        child: Image.asset(
                                          'images/smit.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                      ),
                                      const PrimaryText(
                                        text: 'Smit S.',
                                        size: 40.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                      const PrimaryText(
                                        text: 'MS in Data Analytics',
                                        size: 15.0,
                                        color: AppColors.black,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(7.0),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.mail,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'smitvinod.savla@sjsu.edu',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.house,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'Fremont, CA',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.primary,
                                      AppColors.white,
                                    ],
                                    stops: [0.4, 0.6],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  border: Border.all(
                                      color: AppColors.third, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        width: 200,
                                        child: Image.asset(
                                          'images/madhur1.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                      ),
                                      const PrimaryText(
                                        text: 'Madhur P.',
                                        size: 40.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                      const PrimaryText(
                                        text: 'MS in Data Analytics',
                                        size: 15.0,
                                        color: AppColors.black,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(7.0),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.mail,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'madhur.parakh@sjsu.edu',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.house,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'Santa Clara, CA',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.primary,
                                      AppColors.white,
                                    ],
                                    stops: [0.4, 0.6],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  border: Border.all(
                                      color: AppColors.third, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        width: 200,
                                        child: Image.asset(
                                          'images/shounak1.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                      ),
                                      const PrimaryText(
                                        text: 'Shounak U.',
                                        size: 40.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                      const PrimaryText(
                                        text: 'MS in Data Analytics',
                                        size: 15.0,
                                        color: AppColors.black,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(7.0),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.mail,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'shounak.upadhyay@sjsu.edu',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.house,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'San Jose, CA',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.primary,
                                      AppColors.white,
                                    ],
                                    stops: [0.4, 0.6],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                  border: Border.all(
                                      color: AppColors.third, width: 2.0),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: AppColors.black,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 250,
                                        width: 200,
                                        child: Image.asset(
                                          'images/wanyu1.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(10.0),
                                      ),
                                      const PrimaryText(
                                        text: 'Wanyu H.',
                                        size: 40.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                      const PrimaryText(
                                        text: 'MS in Data Analytics',
                                        size: 15.0,
                                        color: AppColors.black,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(7.0),
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.mail,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'wanyu.huang@sjsu.edu',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.house,
                                            size: 15.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          PrimaryText(
                                            text: 'San Jose , CA',
                                            size: 15.0,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
