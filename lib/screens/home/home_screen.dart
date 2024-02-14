import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> greetings = [
    'Willkommen zurück!',
    'Schönen Tag!',
    'Guten Tag!',
  ];

  String getRandomGreeting() {
    final Random random = Random();
    int index = random.nextInt(greetings.length);
    return greetings[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi!',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  getRandomGreeting(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.router.push(ProfileRoute());
              },
              child: SvgPicture.asset(
                'assets/images/elements/user.svg',
                color: AppColors.purple,
                width: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
