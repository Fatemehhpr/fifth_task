import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fifth_task/services.dart';
import 'package:provider/provider.dart';

import '../bloc/servicecalls_bloc.dart';
import '../providers/controllerProvider.dart';

class refreshScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
                  width: 330,
                  height: 55,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('test'),
                    onPressed: () async{
                      //await searchMerchant(prefs.getString('accessToken'));
                      context.read<ServicecallsBloc>().add(ServicecallsTestButton('wrong access token for test'));
                    },
                  ),
                )
    );
  }
}