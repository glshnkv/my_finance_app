part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileDataEvent extends ProfileEvent {}

class UpdateProfileDataEvent extends ProfileEvent {
  final String userName;
  final String userEmail;

  UpdateProfileDataEvent({required this.userName, required this.userEmail});
}