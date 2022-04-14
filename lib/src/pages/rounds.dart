import 'package:flutter/material.dart';
import 'package:valo/src/pages/match.dart';

class Rounds extends StatelessWidget {
  final String mapa;
  const Rounds({Key? key, required this.mapa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "ValoRounds",
          style: TextStyle(color: Colors.white60),
        ),
      ),
      body: _column(context, mapa),
    );
  }
}

Widget _column(context, String mapa) {
  String selectedmap = mapa;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      const SizedBox(height: 30),
      Text(
        selectedmap,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 120,
      ),
      Image.asset("assets/images/pepeiron.png"),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
              onPressed: () {
                String side = "Ataque";
                final route = MaterialPageRoute(
                    builder: (context) => Match(mapa: mapa, side: side));
                Navigator.push(context, route);
              },
              child: const SizedBox(
                  width: 80, height: 40, child: Center(child: Text("Ataque")))),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
              onPressed: () {
                String side = "Defensa";
                final route = MaterialPageRoute(
                    builder: (context) => Match(mapa: mapa, side: side));
                Navigator.push(context, route);
              },
              child: const SizedBox(
                  width: 80,
                  height: 40,
                  child: Center(child: Text("Defensa")))),
        ],
      )
    ],
  );
}
