import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_app/models/bill_model.dart';
import 'package:my_finance_app/repository/bills_repository.dart';
import 'package:my_finance_app/services/shared_preferences.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final BillsRepository _billsRepository;

  FinanceBloc(this._billsRepository) : super(FinanceInitial()) {
    on<GetIncomeBillsEvent>(_getIncomeBillsHandler);
    on<GetSpendBillsEvent>(_getSpendBillsHandler);
    on<AddIncomeBillEvent>(_addIncomeBillHandler);
    on<AddSpendBillEvent>(_addSpendBillHandler);
    on<GetSumsEvent>(_getSumsHandler);
  }

  void _getIncomeBillsHandler(
      GetIncomeBillsEvent event, Emitter<FinanceState> emit) {
    final _incomeBills = _billsRepository.getIncomeBills;
    emit(LoadedIncomeBillsState(incomeBills: _incomeBills));
  }

  void _getSpendBillsHandler(
      GetSpendBillsEvent event, Emitter<FinanceState> emit) {
    final _spendBills = _billsRepository.getSpendBills;
    emit(LoadedSpendBillsState(spendBills: _spendBills));
  }

  void _addIncomeBillHandler(
      AddIncomeBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    storage.income += event.incomeBill.value;

    _billsRepository.addNewIncomeBill(event.incomeBill);
    final _incomeBills = _billsRepository.getIncomeBills;
    emit(LoadedIncomeBillsState(incomeBills: _incomeBills));
  }

  void _addSpendBillHandler(
      AddSpendBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    storage.spend += event.spendBill.value;

    _billsRepository.addNewSpendBill(event.spendBill);
    final _spendBills = _billsRepository.getSpendBills;
    emit(LoadedSpendBillsState(spendBills: _spendBills));
  }

  void _getSumsHandler(GetSumsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    emit(LoadedSumsState(incomeSum: storage.income, spendSum: storage.spend));
  }
}
