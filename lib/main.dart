import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_app/my_finance_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyFinanceApp());
}

