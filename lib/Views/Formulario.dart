import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Customs/EKInputText.dart';
import '../Customs/RFButton.dart';
import '../Firebase/Objects/Room.dart';


class Formulario extends StatelessWidget {
  Formulario({Key? key}) : super(key: key);

  EKInputText Nombre = EKInputText( titulo: "Nombre",ayuda: "De la coleccion nueva.",);
  EKInputText Imagen = EKInputText(titulo: "Imagen",ayuda: "Tipo: URL.",);
  EKInputText Miembros = EKInputText(titulo: "Miembros",);
  FirebaseFirestore db=FirebaseFirestore.instance;

  void btn1Pressed(BuildContext context) async {
    Room room= new Room(
        name: Nombre.getText(),
        image: Imagen.getText(),
        members: int.parse(Miembros.getText()));

    db
        .collection("rooms")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(room.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));
        Navigator.of(context).popAndPushNamed("/Home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORMULARIO'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(30)),
            RFButton(),
            Padding(padding: EdgeInsets.all(40)),
            Nombre,
            Imagen,
            Miembros,
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
                    Navigator.of(context).popAndPushNamed("/Home");

                  },
                  child: Text("CANCELAR"),style:OutlinedButton.styleFrom(primary: Colors.white, textStyle: TextStyle(fontSize: 20,),backgroundColor: Colors.black),
                ),

              ],
            )
          ],

        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}