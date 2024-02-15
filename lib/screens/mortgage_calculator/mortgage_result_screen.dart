import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:pie_chart/pie_chart.dart';

@RoutePage()
class MortgageResultScreen extends StatefulWidget {
  final double propertyValue;
  final double initialFee;
  final int term;
  final double rate;

  const MortgageResultScreen(
      {super.key,
      required this.propertyValue,
      required this.initialFee,
      required this.term,
      required this.rate});

  @override
  State<MortgageResultScreen> createState() => _MortgageResultScreenState();
}

class _MortgageResultScreenState extends State<MortgageResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () {
            context.router.push(MainRoute());
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
      body: BlocProvider(
        create: (context) => MortgageCalculatorBloc()
          ..add(CalculateMortgageEvent(
              propertyValue: widget.propertyValue,
              initialFee: widget.initialFee,
              term: widget.term,
              rate: widget.rate)),
        child: BlocConsumer<MortgageCalculatorBloc, MortgageCalculatorState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CalculatedMortgageState) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kreditbetrag',
                                style: TextStyle(
                                  color: AppColors.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${state.loanAmount.toStringAsFixed(0)} \$',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Aufgelaufene Zinsen',
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${state.overPayment.toStringAsFixed(0)} \$',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Monatliche Zahlung',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${state.monthlyPayment.toStringAsFixed(0)} \$',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Verschuldung + Zinsen',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${state.finalPayment.toStringAsFixed(0)} \$',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Center(
                        child: Column(
                          children: [
                            PieChart(
                              animationDuration: Duration(milliseconds: 500),
                              chartRadius: 175,
                              dataMap: {
                                'Kreditbetrag': state.loanAmount,
                                'Aufgelaufene Zinsen': state.overPayment
                              },
                              colorList: [AppColors.purple, AppColors.red],
                              legendOptions: LegendOptions(
                                showLegends: false,
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValueBackground: false,
                                chartValueStyle: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.purple,
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Center(
                                child: Text(
                                  'Kreditbetrag',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Center(
                                child: Text(
                                  'Aufgelaufene Zinsen',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
