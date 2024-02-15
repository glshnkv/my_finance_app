import 'package:my_finance_app/models/bill_model.dart';

class BillsRepository {
  final List<BillModel> _spendBillsList = [
    BillModel(value: 1000, comment: 'cafe', date: DateTime.now()),
    BillModel(value: 1000, comment: 'cafe', date: DateTime.now()),
    BillModel(value: 1000, comment: 'cafe', date: DateTime.now()),
    BillModel(value: 1000, comment: 'cafe', date: DateTime.now()),
  ];

  final List<BillModel> _incomeBillsList = [
    BillModel(value: 5000, comment: 'salary', date: DateTime.now()),
    BillModel(value: 4000, comment: 'salary', date: DateTime.now()),
    BillModel(value: 3000, comment: 'salary', date: DateTime.now()),
    BillModel(value: 2000, comment: 'salary', date: DateTime.now()),
    BillModel(value: 1000, comment: 'salary', date: DateTime.now()),
  ];

  List<BillModel> get getSpendBills => _spendBillsList;

  void addNewSpendBill(BillModel bill) => _spendBillsList.add(bill);

  List<BillModel> get getIncomeBills => _incomeBillsList;

  void addNewIncomeBill(BillModel bill) => _incomeBillsList.add(bill);

}