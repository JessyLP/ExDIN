
import 'package:ex_din/Views/Formulario.dart';
import 'package:ex_din/Views/OnBoardingView.dart';
import 'package:ex_din/Views/SplashView.dart';
import 'package:flutter/material.dart';

import 'Views/ItemGrid.dart';
import 'Views/HomeView.dart';
import 'Views/LoginView.dart';
import 'Views/RegisterView.dart';


class App extends StatelessWidget {

  App({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Splash',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        '/Login':(context) => LoginView(),
        '/Registro':(context) => RegisterView(),
        '/Splash':(context) => SplashView("assets/images/homer1.png"),
        '/OnBoarding':(context) => OnBoardingView(),
        '/Home':(context) => HomeView(),
        '/Grid':(context) => ItemGrid(),
        '/form':(context) => Formulario(),

      },
    );
  }
}