import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_app/models/bill_model.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';
import 'package:my_finance_app/widgets/textfield_app_widget.dart';

class AddSpendTab extends StatefulWidget {
  const AddSpendTab({super.key});

  @override
  State<AddSpendTab> createState() => _AddSpendTabState();
}

class _AddSpendTabState extends State<AddSpendTab> {
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
              'Ausgaben',
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
              hintText: 'Zum Beispiel, das Cafe',
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
                context.read<FinanceBloc>().add(AddSpendBillEvent(
                    spendBill: BillModel(
                        value: double.parse(valueController.text),
                        comment: commentController.text,
                        date: DateTime.now()
                    )));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.purple,
                    content: Text(
                      'Ausgabe erfolgreich erstellt',
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
