import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget{

  final String ImgUrl;
  final String Name;
  final Function(int index) onShortClick;
  final int index;

  const GridItem({Key? key, required this.ImgUrl, required this.Name,
    required this.onShortClick, required this.index}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onShortClick(index);
      },
      child: Card(
        color: Colors.purple[700],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(ImgUrl,height: 300,width: 350),
            Divider(color: Colors.blue,height: 2,thickness: 2),
            Padding(padding: EdgeInsets.all(4)),
            Text(Name),
          ],
        ),
      ),
    );
  }
}