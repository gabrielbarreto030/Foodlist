import 'package:flutter/material.dart';
import 'package:foodlist/screen/Formulario_compras.dart';

class Listadecompras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Compras"),),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Garrafa de Água", style: TextStyle(fontSize: 24),),
              subtitle: Text("2 Litros", style: TextStyle(fontSize: 16),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormularioCompra(),
          )
          ).then((Novoitem)=> debugPrint(Novoitem.toString())
          );



        },
        child: Icon(Icons.add),
      ),
    );
  }

}