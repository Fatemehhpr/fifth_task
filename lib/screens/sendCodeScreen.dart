
import 'package:fifth_task/bloc/servicecalls_bloc.dart';
import 'package:fifth_task/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fifth_task/providers/controllerProvider.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../services.dart';
import '../widgets/icon.dart';
import '../widgets/textField.dart';

class sendCodeScreen extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'sendCodePage',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff002955)
            ),
          ),
        ),
      ),
      body: 
      // BlocProvider<ServicecallsBloc>(
      //   create: (context) {
      //     return ServicecallsBloc();
      //   },
      //   child: 
        Center(
          child: Container(
            width: 330,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 80, 2, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  iconWidget(icon: CupertinoIcons.envelope_circle_fill,),
                  SizedBox(
                    height: 70,
                  ),
                  textfieldWidget(label: 'Phone Number', controller: phoneNumberController),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 330,
                    height: 55,
                    child: BlocBuilder<ServicecallsBloc, ServicecallsState> (
                        builder: (context, state) {
                          if (state is ServicecallsSendCodeSuccessful) {
                            //Navigator.pushNamed(context, '/login');
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushNamed(context, '/login');
                              return;
                            });
                            //return Container();
                          }
                          else if (state is ServicecallsLoginSuccessful) {
                            //Navigator.pushNamed(context, '/refresh');
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushNamed(context, '/refresh');
                              return;
                            });
                          }
                          else if (state is ServicecallsSearchMerchantSuccessful) {
                            print('search merchant was successful');
                            return Container();
                            //return Container();
                          }
                          // else if (state !is ServicecallsInitial){
                          //   print('unvalid state');
                          // }
                          else if (state is ServicecallsInitial) {
                            return ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style,
                              child: Text('send Code'),
                              onPressed: () async{
                                Provider.of<controllerProvider>(context, listen: false).setNumberController(phoneNumberController);
                                context.read<ServicecallsBloc>().add(ServicecallsSendCodeButton(phoneNumberController.text));
                              },
                            );
                          }
                          print('unvalid state');
                          return Container();
                        }
                    ),
                    
                  ),
                  // Expanded(
                  //   child: BlocBuilder<ServicecallsBloc, ServicecallsState>(
                  //       builder: (context, state) {
                  //         if (state is ServicecallsSendCodeSuccessful) {
                  //           Navigator.pushNamed(context, '/login');
                  //         }
                  //         else if (state is ServicecallsLoginSuccessful) {
                  //           Navigator.pushNamed(context, '/refresh');
                  //         }
                  //         else if (state is ServicecallsSearchMerchantSuccessful) {
                  //           print('search merchant was successful');
                  //         }
                  //         else {
                  //           print('your state was unvalid');
                  //         }
                  //         return Container();
                  //       }
                  //   ),
                  // ),
                ],

              ),
            ),
          )
        ),
      //),
    );
  }
}