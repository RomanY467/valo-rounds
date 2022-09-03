import 'package:flutter/material.dart';

Future<void> ff(context, List<String> lista) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Victoria o Derrota?"),
          actions: <Widget>[
            TextButton(
                child: Text('Victoria'),
                onPressed: () {
                  lista.add("Victory");
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('Derrota'),
                onPressed: () {
                  lista.add("Defeat");
                  Navigator.of(context).pop();
                }),
          ],
        );
      });
}

Future<void> brisa(context, mapa, List<String> lista) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Como atacaron?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Rush'),
            onPressed: () {
              Navigator.of(context).pop();
              _site(context, mapa, lista);
            },
          ),
          TextButton(
            child: const Text('Default'),
            onPressed: () {
              Navigator.of(context).pop();
              lista.add("Default");
            },
          ),
          TextButton(
            child: const Text('Picks'),
            onPressed: () {
              lista.add("Picks");
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _site(context, mapa, List<String> lista) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      if (mapa != "Haven") {
        return AlertDialog(
          title: const Text('Site Rusheado:'),
          actions: <Widget>[
            TextButton(
              child: const Text('A'),
              onPressed: () {
                lista.add("Rush A");
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('B'),
              onPressed: () {
                lista.add("Rush B");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } else {
        return AlertDialog(
          title: const Text('Site Rusheado:'),
          actions: <Widget>[
            TextButton(
              child: const Text('A'),
              onPressed: () {
                lista.add("Rush A");
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('B'),
              onPressed: () {
                lista.add("Rush B");
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('C'),
              onPressed: () {
                lista.add("Rush C");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    },
  );
}
