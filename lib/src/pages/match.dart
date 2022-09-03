// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:valo/src/pages/result.dart';
import 'package:valo/src/pages/site.dart';

class Match extends StatefulWidget {
  final String mapa, side, alliesS, enemiesS;
  const Match({
    Key? key,
    required this.mapa,
    required this.side,
    required this.alliesS,
    required this.enemiesS,
  }) : super(key: key);

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  int wins = 0;
  int losses = 0;
  String v_d = "";
  List<String> listaR = [];
  List<String> listaR2 = [];
  bool finalizado = false;
  bool pos_remake = false;
  bool pos_empate = false;
  bool empatados = false;

  bool ultima_ronda = false;

  //Comprueba si es el inicio del Match y agrega Mapa y MapSide a listaR
  void _addMapSide() {
    if (wins + losses == 0) {
      listaR.add(widget.mapa);
      listaR.add(widget.side);
      listaR.add(widget.alliesS);
      listaR.add(widget.enemiesS);
    }
  }

  void suma_resta(bool valor) {
    setState(() {
      _addMapSide();
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

//Si el match ya tiene ganador le da el valor de victoria/derrota a v_d y navega a pagina de Resultados
  void _finalizado() {
    if (v_d == "Victoria!") {
      listaR.add("Victory");
    } else if (v_d == "Derrota!") {
      listaR.add("Defeat");
    }
    if (finalizado == true) {
      //Coloca los datos de la ronda en la listaR2 (Solo de Side y Mapa)
      listaR2.add(listaR[0]);
      listaR2.add(listaR[1]);
      listaR2.add(listaR[2]);
      listaR2.add(listaR[3]);
      //Coloca los datos de las rondas en un solo elemento de la listaR2
      String elemento = "";
      for (int i = 4; i < listaR.length - 2; i++) {
        elemento = elemento + listaR[i] + "/";
      }
      elemento = elemento + listaR[listaR.length - 1];
      listaR2.add(elemento);
      listaR2.add(listaR[listaR.length - 1]);

      final route = MaterialPageRoute(
          builder: (context) => Resultado(
              mapa: widget.mapa,
              side: widget.side,
              listaR: listaR,
              listaR2: listaR2));
      Navigator.push(context, route);
    }
  }

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[800]),
                onPressed: () async {
                  suma_resta(true);
                  await brisa(context, widget.mapa, listaR);
                  _finalizado();

                  print(listaR);
                },
                child: const SizedBox(
                    width: 100,
                    height: 60,
                    child: Center(child: Text("Victoria")))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red[800]),
                onPressed: () async {
                  suma_resta(false);
                  await brisa(context, widget.mapa, listaR);
                  _finalizado();
                },
                child: const SizedBox(
                    width: 100,
                    height: 60,
                    child: Center(child: Text("Derrota")))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black54),
                onPressed: () {
                  if (pos_remake == true) {
                    listaR.add("Remake");
                    finalizado = true;
                    _finalizado();
                  }
                },
                child: const SizedBox(
                    width: 80,
                    height: 40,
                    child: Center(child: Text("Remake")))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black87),
                onPressed: () async {
                  if (wins + losses >= 4) {
                    listaR.add("FF");
                    await ff(context, listaR);
                    v_d = "FF";
                    finalizado = true;

                    _finalizado();
                  }
                },
                child: const SizedBox(
                    width: 80, height: 40, child: Center(child: Text("/FF")))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black87),
                onPressed: () {
                  if (pos_empate == true) {
                    if (wins == losses) {
                      listaR.add("Draw");
                      finalizado = true;
                      v_d = "Empate";
                      _finalizado();
                    }
                  }
                },
                child: const SizedBox(
                    width: 80,
                    height: 40,
                    child: Center(child: Text("Empate"))))
          ],
        ),
      ],
    );
  }

  void resultscreen() {
    final route = MaterialPageRoute(
        builder: (context) => Resultado(
            mapa: widget.mapa,
            side: widget.side,
            listaR: listaR,
            listaR2: listaR2));
    Navigator.push(context, route);
  }
}
