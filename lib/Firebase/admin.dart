import 'package:cloud_firestore/cloud_firestore.dart';

import 'Objects/Perfil.dart';


class admin{

  FirebaseFirestore db = FirebaseFirestore.instance;

  FBAdmin(){

  }

  Future<Perfil?> descargarPerfil(String? idPerfil) async {
    final docRef = db.collection("perfiles").doc(idPerfil)
        .withConverter(fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );


    final docSnap = await docRef.get();
    //DataHolder().perfil=docSnap.data()!;
    return docSnap.data();
  }
}