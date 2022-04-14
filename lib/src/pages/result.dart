import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String mapa;
  final String side;
  final List<String> listaR;

  const Resultado(
      {Key? key, required this.mapa, required this.side, required this.listaR})
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
    print(lista);
    int len = widget.listaR.length;
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            lista[len - 1],
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "$mapa",
            style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
