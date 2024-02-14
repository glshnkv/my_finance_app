import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';
import 'package:my_finance_app/widgets/textfield_app_widget.dart';

@RoutePage()
class MortgageCalculatorScreen extends StatefulWidget {
  const MortgageCalculatorScreen({super.key});

  @override
  State<MortgageCalculatorScreen> createState() =>
      _MortgageCalculatorScreenState();
}

class _MortgageCalculatorScreenState extends State<MortgageCalculatorScreen> {
  final costController = TextEditingController();
  final initialFeeController = TextEditingController();
  final termController = TextEditingController();
  final rateController = TextEditingController();

  @override
  void dispose() {
    costController.dispose();
    initialFeeController.dispose();
    termController.dispose();
    rateController.dispose();
    super.dispose();
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
            Text(
              'Hypothekenrechner',
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
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              TextFieldAppWidget(
                  controller: costController,
                  hintText: '',
                  title: 'Immobilienwert, \$'),
              SizedBox(height: 15),
              TextFieldAppWidget(
                  controller: initialFeeController,
                  hintText: '',
                  title: 'Ursprünglicher Beitrag, \$'),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 200,
                      child: TextFieldAppWidget(
                          controller: termController,
                          hintText: '',
                          title: 'Hypothekenlaufzeit, Jahr')),
                  Container(
                    width: 130,
                    child: TextFieldAppWidget(
                        controller: rateController,
                        hintText: '',
                        title: 'Zinssatz, %'),
                  ),
                ],
              ),
              SizedBox(height: 25),
              ActionButtonWidget(
                  text: 'Berechnen',
                  color: AppColors.purple,
                  width: 375,
                  onTap: () {
                    if (costController.text != '' ||
                        initialFeeController.text != '' ||
                        termController.text != '' ||
                        rateController.text != '') {
                      context.router.push(MortgageResultRoute(
                          propertyValue: double.parse(costController.text),
                          initialFee: double.parse(initialFeeController.text),
                          term: int.parse(termController.text),
                          rate: double.parse(rateController.text)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.purple,
                          content: Text(
                            'Alle Felder müssen ausgefüllt werden',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
