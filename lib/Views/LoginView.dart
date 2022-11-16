import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Customs/InputText.dart';


class LoginView extends StatelessWidget{

  LoginView({Key? key}) : super(key:key);


  InputText inputUser = InputText(
    titulo: "Correo:",
    ayuda:"ejemplo@gmail.com",);
  InputText inputPassword = InputText(
    titulo: "Password:",
    ayuda:"Mayor de 7 caracteres",
    blIsPsswd: true,);


  void btn1Pressed(BuildContext context) async{
    /* print(input1.geText());
     print(input2.geText());*/
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: inputUser.getText(),
        password: inputPassword.getText(),
      );Navigator.of(context).popAndPushNamed("/OnBoarding");
    } on FirebaseAuthException catch (e) {
      print("------------> ERROR AL CREAR EL USUARIO.");
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    print("USUARIO CREADO CORRECTAMENTE");
  }



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home: Container(
          child: Scaffold(

            appBar: AppBar(
              title: const Text(' LOGIN  '),
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold ),
              backgroundColor: Colors.deepPurple,
            ),
            body:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  inputUser,
                  inputPassword,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: inputUser.getText(),
                              password: inputPassword.getText(),
                            );Navigator.of(context).popAndPushNamed("/Home");
                          } on FirebaseAuthException catch (e) {
                            print("------------> ERROR AL ENTRAR .");
                            if (e.code == 'user-not-found') {
                              print('No user found dor that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user');
                            }
                          } catch (e) {
                            print(e);
                          };
                        },child: Text(' LOGIN'),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo
                        ),

                      ),


                      ElevatedButton.icon(
                        onPressed: (){
                          Navigator.of(context).popAndPushNamed("/registerview");
                        },
                        icon: Icon(Icons.accessibility, size: 18),
                        label: Text(' REGISTRAR'),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),

                      ),


                    ],
                  ),
                ],
              ),

            ),
            backgroundColor: Colors.cyan,

          ),
        )
    );

  }

}
