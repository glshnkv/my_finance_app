import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_finance_app/repository/bills_repository.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';

class SpendTab extends StatefulWidget {
  const SpendTab({super.key});

  @override
  State<SpendTab> createState() => _SpendTabState();
}

class _SpendTabState extends State<SpendTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocProvider(
        create: (context) =>
        FinanceBloc(GetIt.I<BillsRepository>())..add(GetSpendBillsEvent()),
        child: BlocBuilder<FinanceBloc, FinanceState>(
          builder: (context, state) {
            if (state is LoadedSpendBillsState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemCount: state.spendBills.length,
                  reverse: true,
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 15),
                  itemBuilder: (BuildContext context, int index) {
                    final spendBill = state.spendBills[index];
                    return Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$ ${spendBill.value}',
                            style: TextStyle(
                              color: AppColors.purple,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${spendBill.comment}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${spendBill.date.day}-${spendBill.date.month}-${spendBill.date.year}',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
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
