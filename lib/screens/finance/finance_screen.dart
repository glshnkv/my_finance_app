import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/screens/finance/income_tab.dart';
import 'package:my_finance_app/screens/finance/spend_tab.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Umsatzerlöse'),
              Tab(text: 'Ausgaben'),
            ],
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Schätzungen',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
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
        body: TabBarView(
          children: [
            IncomeTab(),
            SpendTab(),
          ],
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router.push(AddBillRoute());
            },
            backgroundColor: AppColors.white,
            child: Icon(Icons.add, color: AppColors.purple,),
          ),
      ),
    );
  }
}
