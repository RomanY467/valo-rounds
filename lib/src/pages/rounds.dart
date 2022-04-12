import 'package:flutter/material.dart';

class Rounds extends StatefulWidget {
  const Rounds({Key? key}) : super(key: key);

  @override
  State<Rounds> createState() => _RoundsState();
}

class _RoundsState extends State<Rounds> {
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
      body: _column(),
    );
  }
}

Widget _column() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
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
              onPressed: () {},
              child: const SizedBox(
                  width: 80, height: 40, child: Center(child: Text("Ataque")))),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
              onPressed: () {},
              child: const SizedBox(
                  width: 80, height: 40, child: Center(child: Text("Ataque")))),
        ],
      )
    ],
  );
}
