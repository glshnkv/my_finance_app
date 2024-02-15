import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/models/news_model.dart';
import 'package:my_finance_app/repository/news_repository.dart';
import 'package:my_finance_app/screens/news/widgets/news_tile_widget.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class NewsInfoScreen extends StatefulWidget {
  final NewsModel news;

  const NewsInfoScreen({super.key, required this.news});

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
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
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                    color: AppColors.darkPurple,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.news.image,
                        fit: BoxFit.cover,
                        height: 130,
                        width: 380,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/elements/user.svg',
                            width: 25, color: AppColors.purple),
                        SizedBox(width: 5),
                        Text(
                          widget.news.userName,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.news.title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.news.article,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Weitere Nachrichten',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 315,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: newsRepository.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 15),
                itemBuilder: (BuildContext context, int index) {
                  final news = newsRepository[index];
                  return Container(
                    width: 250,
                    height: 315,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            news.image,
                            fit: BoxFit.cover,
                            width: 250,
                            height: 315,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, AppColors.purple50, AppColors.gradientPurple],
                            ),
                          ),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text(
                                 news.title,
                                 style: TextStyle(
                                   color: AppColors.white,
                                   fontSize: 20,
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               SizedBox(height: 10),
                               Row(
                                 children: [
                                   SvgPicture.asset('assets/images/elements/user.svg',
                                       width: 35, color: AppColors.white),
                                   SizedBox(width: 10),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         news.userName,
                                         style: TextStyle(
                                           color: AppColors.grey,
                                           fontSize: 12,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                       SizedBox(height: 5),
                                       Text(
                                         news.date,
                                         style: TextStyle(
                                           color: AppColors.grey,
                                           fontSize: 12,
                                           fontWeight: FontWeight.w500,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
