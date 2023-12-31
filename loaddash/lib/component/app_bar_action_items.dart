import 'package:flutter/material.dart';
import 'package:loaddash/login.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class AppBarActionItems extends StatefulWidget {
  const AppBarActionItems({super.key, required this.view});

  final String view;

  @override
  State<AppBarActionItems> createState() => _AppBarActionItemsState();
}

class _AppBarActionItemsState extends State<AppBarActionItems> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          icon: const Icon(
            Icons.person,
            color: AppColors.primary,
          ),
          label: (widget.view == 'dash')
              ? const PrimaryText(
                  text: 'Smit Savla',
                  size: 15,
                  fontWeight: FontWeight.w700,
                )
              : (widget.view == 'House 1')
                  ? const PrimaryText(
                      text: 'Madhur Parakh',
                      size: 15,
                      fontWeight: FontWeight.w700,
                    )
                  : (widget.view == 'House 2')
                      ? const PrimaryText(
                          text: 'Shounak Upadhyay',
                          size: 15,
                          fontWeight: FontWeight.w700,
                        )
                      : const PrimaryText(
                          text: 'Wanyu Huang',
                          size: 15,
                          fontWeight: FontWeight.w700,
                        ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.black,
            backgroundColor: AppColors.secondaryBg,
            textStyle: const TextStyle(
              fontSize: 20,
            ),
            padding: const EdgeInsets.all(16.0),
            shadowColor: AppColors.black,
            elevation: 5,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ],
    );
  }
}
