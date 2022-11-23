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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                     Text("Press the button"),
                    RFButton(),
                  ],
        )
      ),
    );
  }
}