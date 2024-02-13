import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:my_finance_app/screens/main/main_screen.dart';
import 'package:my_finance_app/screens/onboarding/onboarding_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),

  ];
}
