part of 'servicecalls_bloc.dart';

@immutable
sealed class ServicecallsEvent {}

class ServicecallsSendCodeButton extends ServicecallsEvent {
  final String phoneNumber;

  ServicecallsSendCodeButton(this.phoneNumber);
}

class ServicecallsLoginButton extends ServicecallsEvent {
  final String phoneNumber;
  final String loginCode;

  ServicecallsLoginButton(this.phoneNumber, this.loginCode);
}

class ServicecallsTestButton extends ServicecallsEvent {
  final String accessToken;

  ServicecallsTestButton(this.accessToken);
}

