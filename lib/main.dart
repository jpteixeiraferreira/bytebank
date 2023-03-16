import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      home: Scaffold(
        body: Lista_transferencia(),
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {},
            child: Icon(Icons.add)),
      ),
    ));

class Lista_transferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
        Item_transferencia(quantidade: 500.0, conta: 001),
        Item_transferencia(quantidade: 600.0, conta: 002),
        Item_transferencia(quantidade: 700.0, conta: 001),
    ]
    ,
    );
  }
}

class Item_transferencia extends StatelessWidget {
  double quantidade;
  int conta;

  Item_transferencia({ required this.quantidade, required this.conta});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(quantidade.toString()),
            subtitle: Text(conta.toString()),
        ));
  }
}

