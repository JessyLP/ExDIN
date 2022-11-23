
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget {


  RFButton({Key? key,}) : super(key:key);


  final TextEditingController myController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(8.0),
      textColor: Colors.white,
      splashColor: Colors.greenAccent,
      elevation: 8.0,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/dona.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text("BUTTON"),
        ),
      ),
      // ),
      onPressed: () {
      },
    );
  }
}


