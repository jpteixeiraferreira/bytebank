import 'package:flutter/material.dart';

void main() =>
    runApp(Bytebank_app());
class Bytebank_app extends StatelessWidget {
  const Bytebank_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          body: Formulario_transferencia(),
        ),
      );
  }
}
class Formulario_transferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: Column(
        children: [
          TextField(),
          TextField(),

        ],
      )
    );
  }
}
class Lista_transferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
          children: <Widget>[
          Item_transferencia(quantidade: 500.0, conta: 001),
          Item_transferencia(quantidade: 600.0, conta: 002),
          Item_transferencia(quantidade: 700.0, conta: 001),
      ]
      ,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
          child: Icon(Icons.add)),
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
            title: Text('Valor: R\$ ${quantidade.toStringAsFixed(2)}'),
            subtitle: Text('Conta: ${conta.toString()}'),
        ));
  }
}

