import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loaddash/component/app_bar_action_items.dart';
import 'package:loaddash/component/right_menu.dart';
import 'package:loaddash/component/side_menu.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/menu/dashboard.dart';
import 'package:loaddash/menu/prediction.dart';
import 'package:loaddash/menu/statistics.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.id, required this.view});

  final String view;
  final String id;

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String startdate = DateFormat('yyyy-MM-dd').format(DateTime(2010, 07, 07));
  String enddate = DateFormat('yyyy-MM-dd').format(DateTime(2010, 07, 07));
  DateTime sdate = DateTime(2010, 07, 08);
  DateTime edate = DateTime(2010, 07, 08);
  late String date;
  String page = 'Dashboard';

  Future<void> _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: sdate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2010, 07, 07),
        lastDate: DateTime(2010, 07, 07).add(const Duration(days: 30)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFEC7E5D),
                onPrimary: Colors.black,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        startdate = DateFormat('yyyy-MM-dd').format(picked);
        sdate = picked;
      });
    }
  }

  Future<void> _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: edate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2010, 07, 07),
        lastDate: DateTime(2010, 07, 07).add(const Duration(days: 30)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFEC7E5D),
                onPrimary: Colors.black,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
              ),
            ),
            child: child!,
          );
        });
    if (picked != null) {
      setState(() {
        enddate = DateFormat('yyyy-MM-dd').format(picked);
        edate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
          width: 200,
          child: SideMenu(id: widget.id, lbl: 'Home', view: widget.view)),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, color: AppColors.black),
              ),
              actions: [
                AppBarActionItems(view: widget.view),
              ],
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: SideMenu(id: widget.id, lbl: 'Home', view: widget.view),
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
                                if (page == 'Dashboard')
                                  const PrimaryText(
                                    text: 'Dashboard',
                                    size: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                if (page == 'Statistics')
                                  const PrimaryText(
                                    text: 'Statistics',
                                    size: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                if (page == 'Prediction')
                                  const PrimaryText(
                                    text: 'Prediction',
                                    size: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          page = 'Dashboard';
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                        backgroundColor: (page == 'Dashboard')
                                            ? AppColors.primary
                                            : const Color(0xFFFFD5B0),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        shadowColor: AppColors.black,
                                        elevation: 5,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      child: PrimaryText(
                                        text: 'Dashboard',
                                        size: 15,
                                        fontWeight: (page == 'Dashboard')
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          page = 'Statistics';
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                        backgroundColor: (page == 'Statistics')
                                            ? AppColors.primary
                                            : const Color(0xFFFFD5B0),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        shadowColor: AppColors.black,
                                        elevation: 5,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      child: PrimaryText(
                                        text: 'Statistics',
                                        size: 15,
                                        fontWeight: (page == 'Statistics')
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          page = 'Prediction';
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                        backgroundColor: (page == 'Prediction')
                                            ? AppColors.primary
                                            : const Color(0xFFFFD5B0),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        shadowColor: AppColors.black,
                                        elevation: 5,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      child: PrimaryText(
                                        text: 'Prediction',
                                        size: 15,
                                        fontWeight: (page == 'Prediction')
                                            ? FontWeight.w700
                                            : FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // const Spacer(
                          //   flex: 1,
                          // ),
                          Expanded(
                            flex: Responsive.isDesktop(context) ? 1 : 3,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton.icon(
                                      icon: const Icon(
                                        Icons.calendar_month_sharp,
                                        color: AppColors.primary,
                                      ),
                                      label: PrimaryText(
                                        text: startdate,
                                        size: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      onPressed: () async {
                                        _startDate(context);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                        backgroundColor: AppColors.white,
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        shadowColor: AppColors.black,
                                        elevation: 5,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                    SizedBox(
                                        width: SizeConfig.blockSizeHorizontal),
                                    TextButton.icon(
                                      icon: const Icon(
                                          Icons.calendar_month_sharp,
                                          color: AppColors.primary),
                                      label: PrimaryText(
                                        text: enddate,
                                        size: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      onPressed: () {
                                        _endDate(context);
                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: AppColors.black,
                                        backgroundColor: AppColors.white,
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        ),
                                        padding: const EdgeInsets.all(16.0),
                                        shadowColor: AppColors.black,
                                        elevation: 5,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 3,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      (page == 'Dashboard')
                          ? Dashboard(
                              sdate: sdate,
                              edate: edate,
                              id: widget.id,
                              view: widget.view)
                          : (page == 'Statistics')
                              ? Statistics(
                                  sdate: sdate,
                                  edate: edate,
                                  id: widget.id,
                                  view: widget.view)
                              : Prediction(
                                  sdate: sdate,
                                  edate: edate,
                                  id: widget.id,
                                  view: widget.view),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      if (!Responsive.isDesktop(context))
                        RightMenu(
                            sdate: sdate,
                            edate: edate,
                            id: widget.id,
                            view: widget.view)
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(view: widget.view),
                          RightMenu(
                              sdate: sdate,
                              edate: edate,
                              id: widget.id,
                              view: widget.view),
                        ],
                      ),
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
