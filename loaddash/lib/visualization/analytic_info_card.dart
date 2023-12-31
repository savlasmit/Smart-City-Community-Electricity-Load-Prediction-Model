import 'package:flutter/material.dart';
import 'package:loaddash/style/colors.dart';

class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard(
      {super.key,
      required this.title,
      required this.count,
      required this.icon,
      required this.color});
  final String title;
  final double count;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (count).toStringAsFixed(3),
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0 / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
            ],
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
