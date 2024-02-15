import 'package:flutter/material.dart';

class BillModel {
  final double value;
  final String comment;
  final DateTime date;

  BillModel({
    required this.value,
    required this.comment,
    required this.date,
  });
}