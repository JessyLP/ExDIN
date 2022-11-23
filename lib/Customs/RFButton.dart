
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFButton extends StatelessWidget {


  RFButton({Key? key,}) : super(key:key);


  final TextEditingController myController = TextEditingController();
  //final String LogoPath;


 /* void fondo(){

    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/dona1.png'),
            fit: BoxFit.cover
        )
    );

    backgroundColor: Colors./*cyan*/transparent;

  }*/


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(8.0),
      textColor: Colors.white,
      splashColor: Colors.greenAccent,
      elevation: 8.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/dona1.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("SIGN OUT"),
        ),
      ),
      // ),
      onPressed: () {
        print('Tapped');
      },
    );
  }
}


