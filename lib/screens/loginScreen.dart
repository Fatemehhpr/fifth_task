import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fifth_task/providers/controllerProvider.dart';
import 'package:fifth_task/screens/sendCodeScreen.dart';
import 'package:provider/provider.dart';

import '../bloc/servicecalls_bloc.dart';
import '../services.dart';
import '../widgets/icon.dart';
import '../widgets/textField.dart';

class loginScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Container(
          width: 330,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 80, 2, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconWidget(icon: CupertinoIcons.person_crop_circle_fill,),
                SizedBox(
                  height: 70,
                ),
                textfieldWidget(label: 'Login Code', controller: codeController),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 330,
                  height: 55,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('login'),
                    onPressed: () async{
                      final number = (Provider.of<controllerProvider>(context, listen: false).getNumberController).text;
                      final code = codeController.text;
                      context.read<ServicecallsBloc>().add(ServicecallsLoginButton(number, code));
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}