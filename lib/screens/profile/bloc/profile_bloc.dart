import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_app/services/shared_preferences.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileDataEvent>(_getProfileDataHandler);
    on<UpdateProfileDataEvent>(_updateProfileDataHandler);
  }

  void _getProfileDataHandler(
      GetProfileDataEvent event, Emitter<ProfileState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    emit(LoadedProfileDataState(
        userName: storage.userName, userEmail: storage.userEmail));
  }

  void _updateProfileDataHandler(
      UpdateProfileDataEvent event, Emitter<ProfileState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    storage.userName = event.userName;
    storage.userEmail = event.userEmail;

    emit(LoadedProfileDataState(
        userName: storage.userName, userEmail: storage.userEmail));
  }
}
