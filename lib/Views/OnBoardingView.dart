import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Customs/EKInputText.dart';
import '../Firebase/Objects/Perfil.dart';




class onBoardingView extends StatelessWidget {
  onBoardingView({Key? key}) : super(key: key);

  InputText Nombre = InputText( titulo: "Nombre",);
  InputText Pais = InputText(titulo: "Pais",);
  InputText Ciudad = InputText(titulo: "Ciudad",);
  FirebaseFirestore db=FirebaseFirestore.instance;

  void btn1Pressed() async {
    Perfil perfil= new Perfil(
        name: Nombre.getText(),
        country: Pais.getText(),
        city: Ciudad.getText());

    db
        .collection("perfiles")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(perfil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {
    //  inputNombre.setInitialValue("VALOR INICIAL NOMBRE!");
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnBoarding'),
        backgroundColor: Colors.deepPurpleAccent,
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
                  onPressed: btn1Pressed,
                  child: Text("ACEPTAR"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    print("PRESIONASTES BOTON 2");
                  },
                  child: Text("CANCELAR"),
                )
              ],
            )
          ],

        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}