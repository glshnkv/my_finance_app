import 'package:flutter/material.dart';
import 'package:my_finance_app/theme/colors.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: width,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
