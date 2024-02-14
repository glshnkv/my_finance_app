import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:my_finance_app/screens/home/home_screen.dart';
import 'package:my_finance_app/screens/main/main_screen.dart';
import 'package:my_finance_app/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:my_finance_app/screens/mortgage_calculator/mortgage_result_screen.dart';
import 'package:my_finance_app/screens/onboarding/onboarding_screen.dart';
import 'package:my_finance_app/screens/profile/edit_profile_screen.dart';
import 'package:my_finance_app/screens/profile/profile_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: MortgageCalculatorRoute.page),
    AutoRoute(page: MortgageResultRoute.page),
  ];
}
