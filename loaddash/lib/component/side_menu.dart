import 'package:flutter/material.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/menu/home.dart';
import 'package:loaddash/menu/teams.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class SideMenu extends StatefulWidget {
  const SideMenu(
      {super.key, required this.id, required this.lbl, required this.view});

  final String id;
  final String lbl;
  final String view;

  @override
  // ignore: library_private_types_in_public_api
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    String lbls = widget.lbl;
    String v = widget.view;
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: AppColors.secondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   height: 100,
              //   alignment: Alignment.topCenter,
              //   width: double.infinity,
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         width: 75,
              //         child: Image.asset(
              //           'images/logo.png',
              //         ),
              //       ),
              //       SizedBox(
              //         height: SizeConfig.blockSizeVertical,
              //       ),
              //       const Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: PrimaryText(
              //             text: 'Smart Community Solar Prediction',
              //             size: 20,
              //             fontWeight: FontWeight.w800,
              //             color: AppColors.black),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              SizedBox(
                width: 75,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PrimaryText(
                    text: 'Smart Community Solar Prediction',
                    size: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.black),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (widget.id == 'Community')
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.assessment,
                            color: (lbls == 'Home' && v == 'dash')
                                ? AppColors.black
                                : AppColors.iconGray,
                            size: (lbls == 'Home' && v == 'dash') ? 30 : 20,
                          ),
                          label: PrimaryText(
                            text: 'Home',
                            size: (lbls == 'Home' && v == 'dash') ? 20 : 16,
                            fontWeight: (lbls == 'Home' && v == 'dash')
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: (lbls == 'Home' && v == 'dash')
                                ? AppColors.black
                                : AppColors.iconGray,
                          ),
                          onPressed: () {
                            setState(() {
                              lbls = 'Home';
                              v = 'dash';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(id: widget.id, view: v)));
                          })
                      : TextButton.icon(
                          icon: Icon(
                            Icons.assessment,
                            color: (lbls == 'Home' && v == 'House 1')
                                ? AppColors.black
                                : AppColors.iconGray,
                            size: (lbls == 'Home' && v == 'House 1') ? 30 : 20,
                          ),
                          label: PrimaryText(
                            text: 'Home',
                            size: (lbls == 'Home' && v == 'House 1') ? 20 : 16,
                            fontWeight: (lbls == 'Home' && v == 'House 1')
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: (lbls == 'Home' && v == 'House 1')
                                ? AppColors.black
                                : AppColors.iconGray,
                          ),
                          onPressed: () {
                            setState(() {
                              lbls = 'Home';
                              v = 'House 1';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(id: widget.id, view: v)));
                          }),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  (widget.id == 'Community')
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.group_outlined,
                            color: (lbls == 'Home' && v == 'House 1')
                                ? AppColors.black
                                : AppColors.iconGray,
                            size: (lbls == 'Home' && v == 'House 1') ? 30 : 20,
                          ),
                          label: PrimaryText(
                            text: 'House 1',
                            size: (lbls == 'Home' && v == 'House 1') ? 20 : 16,
                            fontWeight: (lbls == 'Home' && v == 'House 1')
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: (lbls == 'Home' && v == 'House 1')
                                ? AppColors.black
                                : AppColors.iconGray,
                          ),
                          onPressed: () {
                            setState(() {
                              lbls = 'Home';
                              v = 'House 1';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(id: widget.id, view: v)));
                          })
                      : const SizedBox(
                          height: 0,
                        ),
                  (widget.id == 'Community')
                      ? SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  (widget.id == 'Community')
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.group_outlined,
                            color: (lbls == 'Home' && v == 'House 2')
                                ? AppColors.black
                                : AppColors.iconGray,
                            size: (lbls == 'Home' && v == 'House 2') ? 30 : 20,
                          ),
                          label: PrimaryText(
                            text: 'House 2',
                            size: (lbls == 'Home' && v == 'House 2') ? 20 : 16,
                            fontWeight: (lbls == 'Home' && v == 'House 2')
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: (lbls == 'Home' && v == 'House 2')
                                ? AppColors.black
                                : AppColors.iconGray,
                          ),
                          onPressed: () {
                            setState(() {
                              lbls = 'Home';
                              v = 'House 2';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(id: widget.id, view: v)));
                          })
                      : const SizedBox(
                          height: 0,
                        ),
                  (widget.id == 'Community')
                      ? SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  (widget.id == 'Community')
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.group_outlined,
                            color: (lbls == 'Home' && v == 'House 3')
                                ? AppColors.black
                                : AppColors.iconGray,
                            size: (lbls == 'Home' && v == 'House 3') ? 30 : 20,
                          ),
                          label: PrimaryText(
                            text: 'House 3',
                            size: (lbls == 'Home' && v == 'House 3') ? 20 : 16,
                            fontWeight: (lbls == 'Home' && v == 'House 3')
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: (lbls == 'Home' && v == 'House 3')
                                ? AppColors.black
                                : AppColors.iconGray,
                          ),
                          onPressed: () {
                            setState(() {
                              lbls = 'Home';
                              v = 'House 3';
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(id: widget.id, view: v)));
                          })
                      : const SizedBox(
                          height: 0,
                        ),
                  (widget.id == 'Community')
                      ? SizedBox(
                          height: SizeConfig.blockSizeVertical * 3,
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  // TextButton.icon(
                  //     icon: Icon(
                  //       Icons.model_training_sharp,
                  //       color: (lbls == 'Model')
                  //           ? AppColors.black
                  //           : AppColors.iconGray,
                  //       size: (lbls == 'Model') ? 30 : 20,
                  //     ),
                  //     label: PrimaryText(
                  //       text: 'Model',
                  //       size: (lbls == 'Model') ? 20 : 16,
                  //       fontWeight: (lbls == 'Model')
                  //           ? FontWeight.bold
                  //           : FontWeight.w400,
                  //       color: (lbls == 'Model')
                  //           ? AppColors.black
                  //           : AppColors.iconGray,
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         lbls = 'Model';
                  //       });
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   Models(id: widget.id, view: v)));
                  //     }),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  TextButton.icon(
                      icon: Icon(
                        Icons.group_outlined,
                        color: (lbls == 'Team')
                            ? AppColors.black
                            : AppColors.iconGray,
                        size: (lbls == 'Team') ? 30 : 20,
                      ),
                      label: PrimaryText(
                        text: 'Our Team',
                        size: (lbls == 'Team') ? 20 : 16,
                        fontWeight: (lbls == 'Team')
                            ? FontWeight.bold
                            : FontWeight.w400,
                        color: (lbls == 'Team')
                            ? AppColors.black
                            : AppColors.iconGray,
                      ),
                      onPressed: () {
                        setState(() {
                          lbls = 'Team';
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Teams(id: widget.id, view: v)));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
