import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/repository/news_repository.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/news/widgets/news_tile_widget.dart';
import 'package:my_finance_app/theme/colors.dart';

@RoutePage()
class NewListScreen extends StatefulWidget {
  const NewListScreen({super.key});

  @override
  State<NewListScreen> createState() => _NewListScreenState();
}

class _NewListScreenState extends State<NewListScreen> {
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
            Text(
              'Nachrichten',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: newsRepository.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 15),
          itemBuilder: (BuildContext context, int index) {
            final news = newsRepository[index];
            return NewsTileWidget(
              image: news.image,
              title: news.title,
              article: news.article,
              userName: news.userName,
              onTap: () {
                context.router.push(NewsInfoRoute(news: news));
              },
            );
          },
        ),
      ),
    );
  }
}
