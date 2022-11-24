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
        title: Text("Item"),
      ),
      body:Center(
          child:
                  ListView(
                    padding: const EdgeInsets.all(10),
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/pescado.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Pescado')),
                      ),
                      Text(""),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/carne.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Carne')),
                      ),
                      Text(""),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/veg.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: const Center(child: Text('Vegetales')),
                      ),
                    ],
                  )

        )
      );
  }
}