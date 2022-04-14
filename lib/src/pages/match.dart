import 'package:flutter/material.dart';
import 'package:valo/src/pages/result.dart';
import 'package:valo/src/pages/site.dart';

class Match extends StatefulWidget {
  final String mapa, side;
  const Match({Key? key, required this.mapa, required this.side})
      : super(key: key);

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  int wins = 0;
  int losses = 0;
  // ignore: non_constant_identifier_names
  String v_d = "";
  List<String> listaR = [];
  bool finalizado = false;
  bool pos_remake = false;
  bool pos_empate = false;
  bool empatados = false;

  // ignore: non_constant_identifier_names
  void suma_resta(bool valor) {
    setState(() {
      //Agrega datos de la ronda a la listaR
      if (valor == true) {
        wins++;
        listaR.add("W");
        if (wins >= 13) {
          if (losses <= 11) {
            finalizado = true;
            v_d = "Victoria!";
          } else {
            if (wins - losses == 2) {
              finalizado = true;
              v_d = "Victoria!";
            }
          }
        }
      } else {
        losses++;
        listaR.add("L");
        if (losses >= 13) {
          if (wins <= 11) {
            finalizado = true;
            v_d = "Derrota!";
          } else {
            if (losses - wins == 2) {
              finalizado = true;
              v_d = "Derrota!";
            }
          }
        }
      }

      if (v_d == "Victoria!") {
        listaR.add("Victory");
      } else if (v_d == "Derrota") {
        listaR.add("Defeat");
      }
      // Verifica si es posible hacer remake
      if (wins + losses == 1) {
        pos_remake = true;
      } else {
        pos_remake = false;
      }
      // Verifica si es posible un empate
      if (wins > 12 && losses > 12) {
        pos_empate = true;
      }
    });
    if (finalizado == true) {
      final route = MaterialPageRoute(
          builder: (context) =>
              Resultado(mapa: widget.mapa, side: widget.side, listaR: listaR));
      Navigator.push(context, route);
    }
  }

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
        body: _cuerpo(wins, losses, finalizado));
  }

  Widget _cuerpo(wins, losses, finalizado) {
    return _MatchScreen();
  }

  // ignore: non_constant_identifier_names
  Widget _MatchScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Text(
            "$wins:$losses",
            style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            v_d,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                onPressed: () async {
                  await Brisa(context, widget.mapa, listaR);
                  suma_resta(true);
                },
                child: const SizedBox(
                    width: 80,
                    height: 40,
                    child: Center(child: Text("Victoria")))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[800]),
                onPressed: () async {
                  await Brisa(context, widget.mapa, listaR);
                  suma_resta(false);
                },
                child: const SizedBox(
                    width: 80,
                    height: 40,
                    child: Center(child: Text("Derrota")))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                onPressed: () {
                  listaR.add("R");
                },
                child: const SizedBox(
                    width: 80,
                    height: 40,
                    child: Center(child: Text("Remake")))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[800]),
                onPressed: () {
                  listaR.add("FF");
                  finalizado = true;
                  v_d = "FF";
                },
                child: const SizedBox(
                    width: 80, height: 40, child: Center(child: Text("/FF")))),
          ],
        ),
        Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red[800]),
              onPressed: () {
                if (pos_empate == true) {
                  listaR.add("D");
                  finalizado = true;
                  v_d = "Empate";
                }
              },
              child: const SizedBox(
                  width: 80, height: 40, child: Center(child: Text("Empate")))),
        ),
      ],
    );
  }

  void resultscreen() {
    final route = MaterialPageRoute(
        builder: (context) =>
            Resultado(mapa: widget.mapa, side: widget.side, listaR: listaR));
    Navigator.push(context, route);
  }
}
