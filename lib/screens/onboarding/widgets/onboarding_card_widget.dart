import 'package:flutter/material.dart';
import 'package:my_finance_app/theme/colors.dart';

class OnboardingCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlImage;

  const OnboardingCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(urlImage),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 375,
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
