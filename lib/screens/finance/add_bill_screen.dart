import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/finance/add_income_tab.dart';
import 'package:my_finance_app/screens/finance/add_spend_tab.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddBillScreen extends StatefulWidget {
  const AddBillScreen({super.key});

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.darkPurple,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Umsatzerlöse'),
              Tab(text: 'Ausgaben'),
            ],
          ),
          leading: GestureDetector(
            onTap: () {
              context.router.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.purple,
            ),
          ),
          title: Text(
            'Zurück',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AddIncomeTab(),
            AddSpendTab(),
          ],
        ),
      ),
    );
  }
}
