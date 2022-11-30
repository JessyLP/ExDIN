

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_din/Views/Grid/GridItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../DtHolder/DataHolder.dart';
import '../Firebase/Objects/Perfil.dart';
import '../Firebase/Objects/Room.dart';



class HomeView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  FirebaseFirestore db=FirebaseFirestore.instance;
  String nombre="NOMBRE";
  List<Room> chatRooms = [];


  @override
  void initState(){
    super.initState();
    getProfile();
    getRoomsList();

  }

  void getProfile() async{
    final ref = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).withConverter(
      fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );
    final docSnap = await ref.get();
    final perfil = docSnap.data();
    if (perfil != null) {
      print("---------->"+perfil.toString());
    } else {
      print("No such document.");
    }

  }


  void actualizarNombre()async{
    String? idUser=FirebaseAuth.instance.currentUser?.uid;
    final docRef = db.collection("perfiles").
    doc(idUser).withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();
    DataHolder().perfil=docSnap.data()!;

    if (DataHolder().perfil != null) {
      setState(() {
        nombre=DataHolder().perfil.name!;
      });
    } else {
      print("No such document.");
    }
  }



  void getRoomsList() async{
    final docRef = db.collection("rooms").orderBy("members",descending: true).
    withConverter(fromFirestore: Room.fromFirestore,
        toFirestore: (Room room, _) => room.toFirestore());

    final docsSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docsSnap.docs.length;i++){
        chatRooms.add(docsSnap.docs[i].data());
      }
    });

  }


  void listItemShortClicked(int index){
    print("DEBUG: "+index.toString());
    print("DEBUG: "+chatRooms[index].name!);
    DataHolder().selectedChatRoom=chatRooms[index];
   Navigator.of(context).pushNamed("/Grid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child:
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemCount: chatRooms.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(ImgUrl:chatRooms[index].image!,Name :chatRooms[index].name!, onShortClick: listItemShortClicked,index: index,);
                 }
              ),
      ),
      floatingActionButton:
              FloatingActionButton(
                backgroundColor:  Colors.purple[400],
                hoverColor: Colors.white,
                //foregroundColor: Colors.black,
                mini: true,
                onPressed: () {
                  Navigator.of(context).pushNamed("/form");
                },
                child: Icon(Icons.add,size: 20),
              ),
        );
      }
}