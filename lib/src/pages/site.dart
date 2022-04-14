import 'package:flutter/material.dart';

Future<void> Brisa(context, mapa, List<String> lista) async {
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
              lista.add("Default");
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Picks'),
            onPressed: () {
              lista.add("Picks");
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Hold'),
            onPressed: () {
              lista.add("Hold");
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
