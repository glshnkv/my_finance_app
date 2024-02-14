import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/profile/bloc/profile_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        centerTitle: true,
        title: Text(
          'Profil',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocProvider(
              create: (context) => ProfileBloc()..add(GetProfileDataEvent()),
              child: BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedProfileDataState) {
                    return Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/elements/user.svg',
                          color: AppColors.purple,
                          width: 80,
                        ),
                        SizedBox(height: 15),
                        Text(
                          state.userName,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          state.userEmail,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20),
                        ActionButtonWidget(
                          text: 'Bearbeiten',
                          color: AppColors.purple,
                          width: 140,
                          onTap: () {
                            context.router.push(EditProfileRoute(
                                userName: state.userName,
                                userEmail: state.userEmail));
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  leading: SvgPicture.asset('assets/images/profile/lock.svg'),
                  tileColor: AppColors.darkPurple,
                  title: Text(
                    'Datenschutzbestimmungen',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  leading: SvgPicture.asset(
                      'assets/images/profile/like-thumb_up.svg'),
                  tileColor: AppColors.darkPurple,
                  title: Text(
                    'App bewerten',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  leading:
                      SvgPicture.asset('assets/images/profile/link-url.svg'),
                  tileColor: AppColors.darkPurple,
                  title: Text(
                    'App teilen',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  leading: SvgPicture.asset('assets/images/profile/info.svg'),
                  tileColor: AppColors.darkPurple,
                  title: Text(
                    'Bedingungen für die Nutzung',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
