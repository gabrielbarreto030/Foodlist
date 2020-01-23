

import 'package:flutter/material.dart';
import 'package:foodlist/model/ItemLista.dart';

class FormularioCompra extends StatefulWidget{
  @override
  _FormularioCompraState createState() => _FormularioCompraState();
}

class _FormularioCompraState extends State<FormularioCompra> {
  final TextEditingController _nomeController= new TextEditingController();

  final TextEditingController _quantidadeController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Formulario lista de Compras"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: "Nome do Item" ,
              ),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: _quantidadeController,
                decoration: InputDecoration(
                  labelText: "Quantidade" ,
                ),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.only(top:16),
                child: RaisedButton(
                  onPressed: () {
                    final String NomeProduto= _nomeController.text;
                    final double QtdProduto=double.tryParse(_quantidadeController.text);
                    final ItemLista NovoItem=ItemLista(NomeProduto,QtdProduto);
                    Navigator.pop(context,NovoItem);
                    
                  },
                  child: Text("Adicionar"),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}