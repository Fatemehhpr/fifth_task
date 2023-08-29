import 'package:flutter/material.dart';
import 'package:fifth_task/providers/controllerProvider.dart';
import 'package:fifth_task/screens/loginScreen.dart';
import 'package:fifth_task/screens/refreshScreen.dart';
import 'package:fifth_task/screens/sendCodeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/servicecalls_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => controllerProvider()),
        BlocProvider<ServicecallsBloc>(
        create: (context) {
          return ServicecallsBloc();
        },
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffc0d6e4),
            foregroundColor: Color(0xff002955),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff37475f)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => sendCodeScreen(),
        '/login': (context) => loginScreen(),
        '/refresh': (context) => refreshScreen(),
      },
    );
  }
}





