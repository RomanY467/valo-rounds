// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valo/src/pages/agent_select.dart';
import 'package:valo/src/pages/rounds.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  final mapas = [
    "Ascent",
    "Bind",
    "Breeze",
    "Fracture",
    "Haven",
    "Icebox",
    "Pearl"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "ValoRounds",
          style: TextStyle(color: Colors.white60),
        ),
      ),
      body: ListView(
        children: _mapitas(context),
      ),
    );
  }

  List<Widget> _mapitas(BuildContext context) {
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
          child: _ListTiles(item, context),
        ),
      ]);
    }).toList();
  }

  // ignore: non_constant_identifier_names
  Widget _ListTiles(item, BuildContext context) {
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
        onTap: () {
          final route =
              MaterialPageRoute(builder: (context) => agents(mapa: item));
          Navigator.push(context, route);
        });

    // onTap: () {
    //       final route = MaterialPageRoute(
    //           builder: (context) => Rounds(
    //                 mapa: item,
    //               ));
    //       Navigator.push(context, route);
    //     });
  }
}
