import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:my_finance_app/repository/bills_repository.dart';
import 'package:my_finance_app/repository/news_repository.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/finance/bloc/finance_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> greetings = [
    'Willkommen zurück!',
    'Schönen Tag!',
    'Guten Tag!',
  ];

  String getRandomGreeting() {
    final Random random = Random();
    int index = random.nextInt(greetings.length);
    return greetings[index];
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi!',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  getRandomGreeting(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              BlocProvider(
                create: (context) => FinanceBloc(GetIt.I<BillsRepository>())
                  ..add(GetSumsEvent()),
                child: BlocConsumer<FinanceBloc, FinanceState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoadedSumsState) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.darkPurple,
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/elements/wallet.png'),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/elements/wallet-icon.svg'),
                                    SizedBox(width: 10),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Ihre Einkünfte',
                                            style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.incomeSum}',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/elements/wallet-icon.svg'),
                                    SizedBox(width: 10),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Ihre Ausgaben',
                                            style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            '\$ ${state.spendSum}',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Letzte Nachrichten',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                itemCount: newsRepository.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 15),
                itemBuilder: (BuildContext context, int index) {
                  final news = newsRepository[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColors.darkPurple,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          child: Image.asset(
                            news.image,
                            fit: BoxFit.cover,
                            height: 110,
                            width: 110,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                news.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                context.router.push(NewsInfoRoute(news: news));
                              },
                              child: Text(
                                'Mehr lesen',
                                style: TextStyle(
                                  color: AppColors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
