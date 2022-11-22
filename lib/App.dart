
import 'package:ex_din/Views/OnBoardingView.dart';
import 'package:ex_din/Views/SplashView.dart';
import 'package:flutter/material.dart';

import 'Views/LoginView.dart';
import 'Views/RegisterView.dart';



class App extends StatelessWidget {

  App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //DataHolder().dSCREEN_WIDTH= MediaQuery.of(context).size.width;
    MaterialApp materialAppMobile=const MaterialApp();

    return MaterialApp(
      initialRoute: '/Splash',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        '/Login':(context) => LoginView(),
        '/Registro':(context) => RegisterView(),
        '/Splash':(context) => SplashView("assets/images/dona1.png"),
        '/OnBoarding':(context) => OnBoardingView(),
        // '/Home':(context) => HomeView(),
      },
    );
  }
}