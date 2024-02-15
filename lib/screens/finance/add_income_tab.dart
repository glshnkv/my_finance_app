import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_app/models/bill_model.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';
import 'package:my_finance_app/widgets/textfield_app_widget.dart';

class AddIncomeTab extends StatefulWidget {
  const AddIncomeTab({super.key});

  @override
  State<AddIncomeTab> createState() => _AddIncomeTabState();
}

class _AddIncomeTabState extends State<AddIncomeTab> {
  final commentController = TextEditingController();
  final valueController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Umsatzerlöse',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 15),
          TextFieldAppWidget(
              controller: commentController,
              hintText: 'Zum Beispiel, das Gehalt',
              title: 'Beschreibung'),
          SizedBox(height: 25),
          TextFieldAppWidget(
              controller: valueController,
              hintText: '\$  0.00',
              title: 'Betrag'),
          SizedBox(height: 25),
          ActionButtonWidget(
            text: 'Weiter',
            color: AppColors.purple,
            width: 350,
            onTap: () {
              if (valueController.text != '' || commentController.text != '') {
                context.read<FinanceBloc>().add(AddIncomeBillEvent(
                    incomeBill: BillModel(
                        value: double.parse(valueController.text),
                      comment: commentController.text,
                      date: DateTime.now()
                    )));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.purple,
                    content: Text(
                      'Einkommen erfolgreich hinzugefügt',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                );
                context.router.push(MainRoute());
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
            },
          ),
        ],
      ),
    );
  }
}
