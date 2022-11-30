import 'package:ex_din/Customs/RFButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemGrid extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _ItemGridState();
  }
}

class _ItemGridState extends State<ItemGrid>{
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('TIPOS'),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.cyan,
      body:Center(
          child:
                  ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),

                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/pescado.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Pescado')),
                      ),

                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),

                      Container(
                        child: Column(
                          children: [
                            Text("\nRape\n",style: TextStyle(color: Colors.black)),
                            Text("Este pescado también es conocido con el nombre de sapo o pejesapo. Se trata de un pescado blanco de agua salada que vive en el fondo oceánico. Gracias a la consistencia de su carne, y como sus filetes no tienen espinas, resulta perfecto para los que sienten rechazo al pescado."),

                            Text("\nGallo\n",style: TextStyle(color: Colors.black)),
                            Text("Se trata de un pescado cuya característica principal es que tiene ambos ojos situados en el lado izquierdo del cuerpo. El Gallo es un pescado blanco de textura y sabor suaves con muy bajo contenido en grasa y hay muchas recetas en las que es el protagonista."),

                            Text("\n Bacalao\n",style: TextStyle(color: Colors.black)),
                            Text("El Bacalao es un pescado blanco de agua salada del que existen unas 60 especies distintas, pero el más conocido y de mayor importancia comercial es el bacalao común. Se trata de un pescado de sabor agradable, de hecho más destacado que el de otros pescados blancos.\n"),
                          ],
                        ),
                      ),
                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),


                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/carne.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Carne',style: TextStyle(color: Colors.white))),
                      ),

                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),

                      Container(
                        child: Column(
                          children: [
                            Text("\nDe vaca, res, buey o bien ternera (bóvida)\n",style: TextStyle(color: Colors.black)),
                            Text("Las hamburguesas, las costillas o bien los filetes de vaca y ternera son seguramente los ejemplos más representativos de la carne roja."),

                            Text("\nDe cerdo (porcina)\n",style: TextStyle(color: Colors.black)),
                            Text("La carne de cerdo se emplea para preparar comestibles como el jamón, las salchichas, el bacón o bien el prosciutto. Casi todas las unas partes del cuerpo de los cerdos son susceptibles de utilizarse como comestible, desde la cabeza y la papada hasta las extremidades, el rabo o bien las gónadas."),

                            Text("\n De oveja y cordero (ovina)\n",style: TextStyle(color: Colors.black)),
                            Text("La carne ovina es considerada uno de las clases más saludables. En esta concepción influyen las altas concentraciones de nutrientes relevantes para las defensas como las vitaminas B, el selenio y el cinc, como su proporción inmejorable entre ácidos grasos omega-tres y seis. Sin embargo, el cordero es costoso en comparación con otras carnes rojas \n"),
                          ],
                        ),
                      ),
                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),



                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/veg.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Vegetales')),
                      ),

                      Divider(color: Colors.blue,height: 2,thickness: 2),
                      Divider(color: Colors.blue,height: 2,thickness: 2),

                      Container(
                        child: Column(
                          children: [
                            Text("\n Legumbres\n",style: TextStyle(color: Colors.black)),
                            Text("Que podemos comerlas estando verdes o frescas, como lo son los guisantes, por poner un ejemplo."),

                            Text("\n Bulbos\n",style: TextStyle(color: Colors.black)),
                            Text("Verduras bastante carnosas pero no nacen de las flores, como lo son el ajo, o cualquier otra verdura que se incluya en esta categoría.\n"),
                          ],
                        ),
                      ),
                      ],
                  )

        )
      );
  }
}