part of 'mortgage_calculator_bloc.dart';

@immutable
abstract class MortgageCalculatorState {}

class MortgageCalculatorInitial extends MortgageCalculatorState {}

class CalculatedMortgageState extends MortgageCalculatorState {
  final double loanAmount;
  final double overPayment;
  final double monthlyPayment;
  final double finalPayment;

  CalculatedMortgageState({required this.loanAmount, required this.overPayment, required this.monthlyPayment, required this.finalPayment});
}
