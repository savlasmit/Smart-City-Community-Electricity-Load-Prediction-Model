import 'package:flutter/material.dart';
import 'package:loaddash/config/responsive.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PrimaryText(
                  text: 'Dashboard', size: 30, fontWeight: FontWeight.w800),
              PrimaryText(
                text: 'Payments updates',
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.iconGray,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: Responsive.isDesktop(context) ? 1 : 3,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              prefixIcon: const Icon(Icons.search, color: AppColors.black),
              hintText: 'Search',
              hintStyle:
                  const TextStyle(color: AppColors.iconGray, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
