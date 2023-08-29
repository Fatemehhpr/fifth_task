import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../services.dart';

part 'servicecalls_event.dart';
part 'servicecalls_state.dart';

class ServicecallsBloc extends Bloc<ServicecallsEvent, ServicecallsState> {
  ServicecallsBloc() : super(ServicecallsInitial()) {
    on<ServicecallsEvent>((event, emit) async{
      String phoneNumber = '';
      String loginCode = '';
      String accessToken = '';

      if (event is ServicecallsSendCodeButton) {
        phoneNumber = event.phoneNumber;
        await sendCode(phoneNumber);
        if (prefs.getString('statusCode') == '200') {
          prefs.setString('statusCode', '0');
          prefs.reload();
          print(prefs.getString('statusCode'));
          emit(ServicecallsSendCodeSuccessful());
        }
      }
      if (event is ServicecallsLoginButton) {
        phoneNumber = event.phoneNumber;
        loginCode = event.loginCode;
        print('rrrrr');
        await login(phoneNumber, loginCode);
        if (prefs.getString('statusCode') == '200') {
          prefs.setString('statusCode', '0');
          prefs.reload();
          emit(ServicecallsLoginSuccessful());
        }
      }
      if (event is ServicecallsTestButton) {
        accessToken = event.accessToken;
        await searchMerchant(accessToken);
        if (prefs.getString('statusCode') == '200') {
          prefs.setString('statusCode', '0');
          prefs.reload();
          emit(ServicecallsSearchMerchantSuccessful());
        }
      }
    });
  }
}
