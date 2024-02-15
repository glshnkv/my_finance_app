import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_app/models/bill_model.dart';
import 'package:my_finance_app/services/shared_preferences.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {

  FinanceBloc() : super(FinanceInitial()) {
    on<GetIncomeBillsEvent>(_getIncomeBillsHandler);
    on<GetSpendBillsEvent>(_getSpendBillsHandler);
    on<AddIncomeBillEvent>(_addIncomeBillHandler);
    on<AddSpendBillEvent>(_addSpendBillHandler);
    on<GetSumsEvent>(_getSumsHandler);
  }

  void _getIncomeBillsHandler(
      GetIncomeBillsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final List<BillModel> _incomeBills = convertStringListToBillModelList(storage.incomeBills);
    emit(LoadedIncomeBillsState(incomeBills: _incomeBills));
  }

  void _getSpendBillsHandler(
      GetSpendBillsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    final List<BillModel> _spendBills = convertStringListToBillModelList(storage.spendBills);
    emit(LoadedSpendBillsState(spendBills: _spendBills));
  }

  void _addIncomeBillHandler(
      AddIncomeBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    final String incomeBillString =
        "Value: ${event.incomeBill.value}, Comment: ${event.incomeBill.comment}, Date: ${event.incomeBill.date}";

    final List<String> _incomeBills = storage.incomeBills;
    _incomeBills.add(incomeBillString);
    storage.incomeBills = _incomeBills;

    storage.income += event.incomeBill.value;

    emit(LoadedIncomeBillsState(incomeBills: convertStringListToBillModelList(storage.incomeBills)));
  }

  void _addSpendBillHandler(
      AddSpendBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final String spendBillString =
        "Value: ${event.spendBill.value}, Comment: ${event.spendBill.comment}, Date: ${event.spendBill.date}";

    final List<String> _spendBills = storage.spendBills;
    _spendBills.add(spendBillString);
    storage.spendBills = _spendBills;

    storage.spend += event.spendBill.value;

    emit(LoadedSpendBillsState(spendBills: convertStringListToBillModelList(storage.spendBills)));
  }

  void _getSumsHandler(GetSumsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    emit(LoadedSumsState(incomeSum: storage.income, spendSum: storage.spend));
  }

  List<BillModel> convertStringListToBillModelList(List<String> stringList) {
    List<BillModel> billModels = [];
    for (String billString in stringList) {
      List<String> parts = billString.split(', ');

      double value = double.parse(parts[0].split(': ')[1]);
      String comment = parts[1].split(': ')[1];
      DateTime date = DateTime.parse(parts[2].split(': ')[1]);

      BillModel billModel =
      BillModel(value: value, comment: comment, date: date);
      billModels.add(billModel);
    }
    return billModels;
  }
}
