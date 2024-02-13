import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/onboarding/widgets/onboarding_card_widget.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 500,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        isLastPage = index == 2;
                      });
                    },
                    controller: controller,
                    children: [
                      OnboardingCardWidget(
                        urlImage: 'assets/images/onboarding/1.png',
                        title: 'Willkommen bei unserer App!',
                        subtitle:
                            'Berechnen Sie mühelos Geldzuflüsse. Geben Sie den Betrag ein, wählen Sie die Art und den Zeitraum. Behalten Sie mit uns den Überblick über Ihr Budget!',
                      ),
                      OnboardingCardWidget(
                        urlImage: 'assets/images/onboarding/2.png',
                        title: 'Planen Sie, ein Haus zu kaufen?',
                        subtitle:
                            'Berechnen Sie Ihr Hypothekendarlehen sofort. Legen Sie den Betrag, die Laufzeit und den Zinssatz fest und beginnen Sie Ihre Reise zum Wohneigentum!',
                      ),
                      OnboardingCardWidget(
                        urlImage: 'assets/images/onboarding/3.png',
                        title: 'Lesen Sie die Nachrichten!',
                        subtitle:
                            'Lesen Sie aktuelle Artikel über Ereignisse in der Welt der Finanzen. Schließen Sie sich uns an und verwalten Sie Ihre Finanzen!',
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.white,
                        dotColor: Colors.white38,
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                    ),
                    SizedBox(height: 20),
                    ActionButtonWidget(
                      text: 'Continue',
                      width: 350,
                      color: AppColors.purple,
                      onTap: () {
                        isLastPage
                            ? context.router.push(MainRoute())
                            : controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                      },
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Bedingungen für die Nutzung',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          child: Text(
                            'Datenschutzbestimmungen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
