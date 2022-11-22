import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final String titulo;
  final String ayuda;
  final bool blIsPsswd;



  InputText({Key? key,  this.titulo="",  this.ayuda="",  this.blIsPsswd=false}) : super(key:key);
  final TextEditingController myController = TextEditingController();


  String getText(){
    return myController.text;
  }

  void setInitialValue(String initialValue){
    myController.text=initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: blIsPsswd,
      controller: myController,
      cursorColor: Colors.deepPurple,
      enableSuggestions: !blIsPsswd,
      autocorrect: !blIsPsswd,
      decoration:  InputDecoration(
      icon:ImageIcon(AssetImage('assets/images/dona.png')),
        labelText: titulo,
        labelStyle: TextStyle(
          color: Color(0xFF6B11A4),
        ),
        helperText: ayuda,
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }

}