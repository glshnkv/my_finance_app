import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_finance_app/my_finance_app.dart';
import 'package:my_finance_app/repository/bills_repository.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:my_finance_app/screens/profile/bloc/profile_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetIt.instance.registerSingleton(BillsRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()),
      BlocProvider<MortgageCalculatorBloc>(
          create: (context) => MortgageCalculatorBloc()),
      BlocProvider<MortgageCalculatorBloc>(
          create: (context) => MortgageCalculatorBloc()),
      BlocProvider<FinanceBloc>(
          create: (context) => FinanceBloc(GetIt.I<BillsRepository>())),
    ],
    child: MyFinanceApp(),
  ));
}

