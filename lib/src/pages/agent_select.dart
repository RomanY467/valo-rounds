import 'package:flutter/material.dart';
import 'package:valo/src/pages/rounds.dart';

class agents extends StatefulWidget {
  final String mapa;
  const agents({Key? key, required this.mapa}) : super(key: key);

  @override
  State<agents> createState() => _agentsState();
}

class _agentsState extends State<agents> {
  List<String> agentes = [
    "Astra",
    "Breach",
    "Brimstone",
    "Chamber",
    "Cypher",
    "Fade",
    "Jett",
    "KAY-O",
    "Killjoy",
    "Neon",
    "Omen",
    "Phoenix",
    "Raze",
    "Reyna",
    "Sage",
    "Skye",
    "Sova",
    "Viper",
    "Yoru"
  ];

  List<String> allies = ["-", "-", "-", "-", "-"];
  List<String> enemies = ["-", "-", "-", "-", "-"];
  int counter = 0;

  String alliesS = "";
  String enemiesS = "";

  @override
  Widget build(BuildContext context) {
    //return a Scaffold with a ListView of the agents
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
        body: Column(
          children: [
            Container(
                height: 150,
                color: Colors.grey,
                child: equipos(widget.mapa, allies, enemies)),
            Expanded(
                child: ListView.builder(
              itemCount: agentes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text(agentes[index])),
                  onTap: () {
                    if (counter < 5) {
                      allies[counter] = agentes[index];
                      counter++;
                    } else if (counter < 10) {
                      enemies[counter - 5] = agentes[index];
                      counter++;
                    }
                    if (counter == 10) {
                      for (int i = 0; i < allies.length - 1; i++) {
                        alliesS = alliesS + allies[i] + "/";
                      }
                      alliesS = alliesS + allies[allies.length - 1];

                      for (int i = 0; i < enemies.length - 1; i++) {
                        enemiesS = enemiesS + enemies[i] + "/";
                      }
                      enemiesS = enemiesS + enemies[enemies.length - 1];

                      final route = MaterialPageRoute(
                          builder: (context) => Rounds(
                                mapa: widget.mapa,
                                alliesS: alliesS,
                                enemiesS: enemiesS,
                              ));
                      Navigator.push(context, route);
                    }
                    setState(() {});
                    ;
                  },
                );
              },
            ))
          ],
        ));
  }

  Widget equipos(String mapa, List<String> allies, List<String> enemies) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
        Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            allies[0],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            allies[1],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            allies[2],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            allies[3],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            allies[4],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            enemies[0],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            enemies[1],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            enemies[2],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            enemies[3],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            enemies[4],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ]);
  }
  // List<Widget> agentz(BuildContext context, List<String> allies) {
  //   return agentes.map((item) {
  //     return Column(children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //               colorFilter: ColorFilter.mode(
  //                   Colors.white.withOpacity(0.7), BlendMode.dstATop),
  //               fit: BoxFit.cover,
  //               image: AssetImage("assets/images/$item.png")),
  //         ),
  //         child: _ListTail(item, context),
  //       ),
  //     ]);
  //   }).toList();
  // }

  // Widget _ListTail(item, BuildContext context) {
  //   return ListTile(
  //       title: Center(
  //         child: Text(
  //           item,
  //           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
  //       onTap: () {
  //         if (counter <= 5) {
  //           allies.add(item);
  //         } else {
  //           enemies.add(item);
  //         }
  //       });
  // }
}
