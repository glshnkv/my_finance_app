import 'package:flutter/material.dart';
import 'package:my_finance_app/router/router.dart';

class MyFinanceApp extends StatelessWidget {
  MyFinanceApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: ''),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
