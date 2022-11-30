
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RFButton extends StatelessWidget {




  RFButton({Key? key,}) : super(key:key);


  final TextEditingController myController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(8.0),
      textColor: Colors.white,
      splashColor: Colors.purple,
      elevation: 8.0,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/homer1.png'),
              fit: BoxFit.cover),


          boxShadow:  [
            BoxShadow(
            color:Colors.black,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text("press"),
        ),
      ),

      onPressed: () {
        Fluttertoast.showToast(
            msg: "D'OH",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
      },
    );
  }
}


