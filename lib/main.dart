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

class Lista_transferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: ListTile(leading: Icon(Icons.monetization_on), title: Text('R\$ 4000.00')),
        ),Card(
          child: ListTile(leading: Icon(Icons.monetization_on), title: Text('R\$ 2000.00')),
        ),Card(
          child: ListTile(leading: Icon(Icons.monetization_on), title: Text('R\$ 1500.00')),
        ),Card(
          child: ListTile(leading: Icon(Icons.monetization_on), title: Text('R\$ 500.00')),
        ),
      ],
    );
  }
}
