import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valo/src/gs/valo_sheets.dart';

class Resultado extends StatefulWidget {
  final String mapa;
  final String side;
  final List<String> listaR;
  final List<String> listaR2;

  const Resultado(
      {Key? key,
      required this.mapa,
      required this.side,
      required this.listaR,
      required this.listaR2})
      : super(key: key);

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black54,
          title: const Text(
            "ValoRounds",
            style: TextStyle(color: Colors.white60),
          ),
        ),
        body: _cuerpo(widget.mapa, widget.side, widget.listaR));
  }

  Widget _cuerpo(mapa, side, lista) {
    SheetsApi.insert(widget.listaR2);
    int len = lista.length;
    // ignore: avoid_print
    print("length: " + len.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            lista[len - 1],
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            mapa,
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 80,
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                Navigator.popUntil(
                    context, (Route<dynamic> predicate) => predicate.isFirst);
              },
              child: const SizedBox(
                width: 100,
                height: 60,
                child: Center(
                  child: Text(
                    "New Game",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                SystemNavigator.pop();
                exit(0);
              },
              child: const SizedBox(
                width: 100,
                height: 60,
                child: Center(
                  child: Text(
                    "Exit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
