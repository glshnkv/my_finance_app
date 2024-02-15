import 'package:flutter/material.dart';

class NewsModel {
  final String image;
  final String title;
  final String article;
  final String date;
  final String userName;

  NewsModel({
    required this.userName,
    required this.image,
    required this.title,
    required this.article,
    required this.date,
  });
}