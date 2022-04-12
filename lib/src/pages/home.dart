// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  final mapas = [
    "Ascent",
    "Bind",
    "Breeze",
    "Fracture",
    "Haven",
    "Icebox",
    "Split"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "ValoRounds",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        children: _mapitas(),
      ),
    );
  }

  List<Widget> _mapitas() {
    return mapas.map((item) {
      return Column(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.7), BlendMode.dstATop),
                fit: BoxFit.cover,
                image: AssetImage("assets/images/$item.png")),
          ),
          child: _ListTiles(item),
        ),
      ]);
    }).toList();
  }

  Widget _ListTiles(item) {
    return ListTile(
        title: Center(
            child: Text(
          item,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 40,
        ),
        contentPadding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        onTap: () {});
  }
}
