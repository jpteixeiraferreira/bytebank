import 'package:flutter/material.dart';

void main() => runApp(Bytebank_app());

class Bytebank_app extends StatelessWidget {
  const Bytebank_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Lista_transferencia(),
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
            Item_formulario(
                controller: _controlador_numero_conta,
                rotulo: 'Número da conta',
                dica: '0000-0'),
            Item_formulario(
                controller: _controlador_valor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () => _cria_transferencia(),
            ),
          ],
        ));
  }

  void _cria_transferencia() {
    final int? numero_conta = int.tryParse(_controlador_numero_conta.text);
    final double? valor = double.tryParse(_controlador_valor.text);
    if (numero_conta != 0 &&
        numero_conta != null &&
        valor != 0 &&
        valor != null) {
      final transferencia_criada =
          Transferencia(valor: valor, numero_conta: numero_conta);
      debugPrint('$transferencia_criada');
    }
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
          Item_transferencia(Transferencia(valor: 500.0, numero_conta: 001)),
          Item_transferencia(Transferencia(valor: 800.0, numero_conta: 002)),
          Item_transferencia(Transferencia(valor: 1500.0, numero_conta: 4661)),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}

class Item_transferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const Item_transferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text('Valor: R\$ ${_transferencia.valor.toStringAsFixed(2)}'),
      subtitle: Text('Conta: ${_transferencia.numero_conta.toString()}'),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numero_conta;

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numero_conta: $numero_conta}';
  }

  Transferencia({required this.valor, required this.numero_conta});
}

class Item_formulario extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Item_formulario(
      {required this.controller,
      required this.rotulo,
      required this.dica,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
