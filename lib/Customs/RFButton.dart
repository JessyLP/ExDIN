
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
      textColor: Colors.black,
      splashColor: Colors.purple,
      elevation: 8.0,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/homer1.png'),
              fit: BoxFit.cover),
          border: Border(bottom: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.blue),
              left: BorderSide(color: Colors.blue),
              right: BorderSide(color: Colors.blue)),

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


