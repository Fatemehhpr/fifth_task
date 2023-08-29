import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fifth_task/providers/controllerProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
late SharedPreferences prefs ;
class HttpClient{
  
  static Dio instance=Dio(
    BaseOptions(
    baseUrl: 'https://sit-bnpl.saminray.com/',
    headers: {
        "Content-Type" : 'application/json',
        "BusinessKey" : '1da5ce01-7491-44a2-a823-2f4734ef0aef',
        "accept" : 'text/plain'
    },
  ))
  ..interceptors.add(InterceptorsWrapper(
    onResponse: (e, handler) async{
      if (e.statusCode == 401) {
        await refresh(prefs.getString('refreshToken'));
      }
      handler.resolve(e);
    },
    onError: (e, handler) async{
      if (e.response?.statusCode == 401) {
        await refresh(prefs.getString('refreshToken'));
      }
      else {
        print(e.message);
      }
    },
  ));
}

Future<void> sendCode(String phoneNumber) async{
  prefs = await _prefs;
  final response=await HttpClient.instance.post(
    'usermanagementnew/Auth/SendCode',
    data: {
      "phoneNo":phoneNumber,
    },
    options: Options(
      // headers: {
      //   "Content-Type" : 'application/json',
      //   "BusinessKey" : '1da5ce01-7491-44a2-a823-2f4734ef0aef',
      //   "accept" : 'text/plain'
      // },
    )
  );

  if (response.statusCode==200){
    prefs.setString('statusCode', '200');
    print("code sent");
    //return response.statusCode;
  }else{
    throw Exception();
  }
}

Future<void> login(String phoneNumber, String loginCode) async{
  //prefs = await _prefs;
  final response=await HttpClient.instance.post(
    'usermanagementnew/Auth/Login',
    data: {
      "phoneNo":phoneNumber,
      "loginCode" : loginCode,
    },
    options: Options(
      // headers: {
      //   "Content-Type" : 'application/json',
      //   "BusinessKey" : '1da5ce01-7491-44a2-a823-2f4734ef0aef',
      //   "accept" : 'text/plain'
      // },
    )
  );
  
  if (response.statusCode==200){
    prefs.setString('accessToken', response.data['valueOrDefault']['tokens']['accesstoken']);
    prefs.setString('refreshToken', response.data['valueOrDefault']['tokens']['refreshToken']);
    print('loged in');
    prefs.setString('statusCode', '200');
    
  }else{
    throw Exception();
  }
  

}


Future<void> refresh(String? refreshToken) async{
  final response=await HttpClient.instance.post(
    'usermanagementnew/Auth/Refresh',
    data: {
      "refreshToken" : refreshToken,
    },
    options: Options(
      // headers: {
      //   "Content-Type" : 'application/json',
      //   "BusinessKey" : '1da5ce01-7491-44a2-a823-2f4734ef0aef',
      //   "accept" : 'text/plain'
      // },
    ),
    
  );

  if (response.statusCode==200){
    print('accessToken refreshed');
  }else{
    throw Exception();
  }
}

Future<void> searchMerchant(String? accessToken) async{
  final response=await HttpClient.instance.get(
    'apiappnew/Merchant/SearchMerchant',
    options: Options(
      headers: {
        // "accept" : 'text/plain',
        // "BusinessKey" : '1da5ce01-7491-44a2-a823-2f4734ef0aef',
        "Authorization" : 'Bearer ${accessToken}',
      }
    )
  );

  if (response.statusCode==200){
    prefs.setString('statusCode', '200');
    //prefs.reload();
    print('successful');
    
  } else{
    throw Exception();
  }
}

