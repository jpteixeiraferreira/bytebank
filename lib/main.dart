import 'package:flutter/material.dart';

void main() => runApp(Bytebank_app());

class Bytebank_app extends StatelessWidget {
  const Bytebank_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Formulario_transferencia(),
      ),
    );
  }
}

class Formulario_transferencia extends StatelessWidget {
  final TextEditingController _controlador_numero_conta =
      TextEditingController();
  final TextEditingController _controlador_valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criando Transferência')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controlador_numero_conta,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    labelText: 'Número da conta', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controlador_valor,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
                final int numero_conta = int.parse(_controlador_numero_conta.text);
                final double valor = double.parse(_controlador_valor.text);
                debugPrint('Clicou no botão');
                debugPrint(_controlador_numero_conta.text);
                if(numero_conta != null && numero_conta != 0
                    && valor != null && valor != 0){
                  Item_transferencia(quantidade: valor, conta: numero_conta);
                  debugPrint('Transferência efetuada com sucesso!');
                } else{
                  debugPrint('Transferência não efetuada.');
                }
              },
            ),
          ],
        ));
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
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}

class Item_transferencia extends StatelessWidget {
  double quantidade;
  int conta;

  Item_transferencia({required this.quantidade, required this.conta});

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
