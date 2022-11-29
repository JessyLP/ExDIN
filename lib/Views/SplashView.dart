import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DtHolder/DataHolder.dart';


class SplashView extends StatefulWidget{
  final String LogoPath;
  const SplashView(this.LogoPath, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    super.initState();
    //FirebaseAuth.instance.signOut();
    loadAllData();

  }

  void loadAllData() async{
    await Future.delayed(Duration(seconds: 2));

    //if(FirebaseAuth.instance.currentUser==null){
    if(DataHolder().perfil.uid==null){
      setState(() {
        Navigator.of(context).popAndPushNamed("/Login");
      });
    }
    else{
      bool existe=await checkExistingProfile();
      if(existe){
        setState(() {
          Navigator.of(context).popAndPushNamed("/Home");
        });
      }
      else{
        setState(() {
          Navigator.of(context).popAndPushNamed("/OnBoarding");
        });
      }
    }
  }

  Future<bool> checkExistingProfile() async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    print(idUser);
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    return docsnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.LogoPath)),
            Text("Donut App",style: TextStyle(height: 10,color: Colors.white)),
            const CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
              color: Colors.white,
            )
          ],
        ),
      ),
      backgroundColor: Colors.purple,
    );
  }

}