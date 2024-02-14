part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class LoadedProfileDataState extends ProfileState {
  final String userName;
  final String userEmail;

  LoadedProfileDataState({required this.userName, required this.userEmail});
}
