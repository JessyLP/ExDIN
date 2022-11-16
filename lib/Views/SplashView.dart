import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
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
    // TODO: implement initState
    super.initState();
    //FirebaseAuth.instance.signOut();
    loadAllData();

  }

  void loadAllData() async{
    await Future.delayed(Duration(seconds: 3));
    //CARGAMOS TODOS LOS RECURSOS

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
          Navigator.of(context).popAndPushNamed("/Login");
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
    //print(idUser);
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    return docsnap.exists;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //DataHolder().platformAdmin.initDisplayData(context);
    print("DEBUG: LA PLATAFORMA TIENE UNA ALTURA: "+DataHolder().platformAdmin.SCREEN_HEIGHT.toString());

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(widget.LogoPath),width: DataHolder().platformAdmin.SCREEN_WIDTH,),
            SizedBox(height: DataHolder().platformAdmin.SCREEN_HEIGHT/30),
            Text("Loading...",style: TextStyle(fontSize: DataHolder().platformAdmin.SCREEN_HEIGHT/20)),
            SizedBox(height: DataHolder().platformAdmin.SCREEN_HEIGHT/30),
            const CircularProgressIndicator(
              semanticsLabel: 'Circular progress indicator',
            )
          ],
        ),
      ),
      backgroundColor: Colors.purple,
    );
  }

}