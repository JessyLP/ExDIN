
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
      initialRoute: '/Login',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        '/Login':(context) => LoginView(),
        '/Registro':(context) => RegisterView(),
        '/Splash':(context) => SplashView("assets/images/dona.png"),
        '/OnBoarding':(context) => OnBoardingView(),
        '/Home':(context) => HomeView(),
        '/Grid':(context) => ItemGrid(),

      },
    );
  }
}