import 'package:flutter/material.dart';
import 'package:my_finance_app/theme/colors.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;

  const TextFieldAppWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.title});

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.purple, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.purple, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
