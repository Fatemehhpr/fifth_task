part of 'servicecalls_bloc.dart';

@immutable
sealed class ServicecallsState {}

final class ServicecallsInitial extends ServicecallsState {}

class ServicecallsSendCodeSuccessful extends ServicecallsState {}

class ServicecallsLoginSuccessful extends ServicecallsState {}

class ServicecallsSearchMerchantSuccessful extends ServicecallsState {}
