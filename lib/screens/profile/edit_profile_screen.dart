import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_finance_app/router/router.dart';
import 'package:my_finance_app/screens/profile/bloc/profile_bloc.dart';
import 'package:my_finance_app/theme/colors.dart';
import 'package:my_finance_app/widgets/action_button_widget.dart';
import 'package:my_finance_app/widgets/textfield_app_widget.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String userEmail;

  const EditProfileScreen(
      {super.key, required this.userName, required this.userEmail});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        leading: GestureDetector(
          onTap: () {
            context.router.push(ProfileRoute());
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.purple,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Profil bearbeiten',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              TextFieldAppWidget(
                title: 'Benutzername',
                controller: userNameController,
                hintText: widget.userName,
              ),
              SizedBox(height: 25),
              TextFieldAppWidget(
                title: 'Benutzermail',
                controller: userEmailController,
                hintText: widget.userEmail,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButtonWidget(
                    text: 'Stornieren',
                    color: AppColors.darkPurple,
                    width: 120,
                    onTap: () {
                      context.router.push(ProfileRoute());
                    },
                  ),
                  SizedBox(width: 15),
                  ActionButtonWidget(
                    text: 'Speichern',
                    color: AppColors.purple,
                    width: 120,
                    onTap: () {
                      context.read<ProfileBloc>().add(UpdateProfileDataEvent(
                          userName: userNameController.text,
                          userEmail: userEmailController.text));
                      context.router.push(ProfileRoute());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
