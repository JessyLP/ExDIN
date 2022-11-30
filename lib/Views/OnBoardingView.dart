import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_din/Customs/RFButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Customs/EKInputText.dart';
import '../Firebase/Objects/Perfil.dart';




class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);

  EKInputText Nombre = EKInputText( titulo: "Nombre",);
  EKInputText Pais = EKInputText(titulo: "Pais",);
  EKInputText Ciudad = EKInputText(titulo: "Ciudad",);
  FirebaseFirestore db=FirebaseFirestore.instance;

  void btn1Pressed(BuildContext context) async {
    Perfil perfil= new Perfil(
        name: Nombre.getText(),
        country: Pais.getText(),
        city: Ciudad.getText());

    db
        .collection("perfiles")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(perfil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
    Navigator.of(context).popAndPushNamed("/Home");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoarding'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Nombre,
            Pais,
            Ciudad,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed:(){
                    btn1Pressed(context);
                  },
                  child: Text("ACEPTAR"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,), backgroundColor: Colors.black),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.of(context).popAndPushNamed("/Login");
                  },
                  child: Text("CANCELAR"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.black),
                ),
                Text("\n"),
                RFButton(),
              ],
            )
          ],

        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}