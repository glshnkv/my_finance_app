import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/screens/finance/finance_screen.dart';
import 'package:my_finance_app/screens/home/home_screen.dart';
import 'package:my_finance_app/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:my_finance_app/screens/news/news_list_screen.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [HomeScreen(), NewListScreen(), MortgageCalculatorScreen(), FinanceScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: AppColors.purple);
            } else {
              return const IconThemeData(color: AppColors.grey);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purple);
            }
            return const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.grey);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.black,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
        selectedIcon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.purple),
              icon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.grey),
              label: 'Hauptseite',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.purple),
              icon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.grey),
              label: 'Nachrichten',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/mortgage.svg', color: AppColors.purple),
              icon: SvgPicture.asset('assets/images/tab-icons/mortgage.svg', color: AppColors.grey),
              label: 'Hypothek',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/estimates.svg', color: AppColors.purple),
              icon: SvgPicture.asset('assets/images/tab-icons/estimates.svg', color: AppColors.grey),
              label: 'Schätzungen',
            ),
          ],
        ),
      ),
    );
  }
}
