import 'package:flutter/material.dart';
import 'package:foodlist/dao/itemdao.dart';
import 'package:foodlist/database/database.dart';
import 'package:foodlist/model/ItemLista.dart';
import 'package:foodlist/screen/Formulario_compras.dart';

class Listadecompras extends StatefulWidget {
  @override
  _ListadecomprasState createState() => _ListadecomprasState();
}

class _ListadecomprasState extends State<Listadecompras> {
  @override
  Widget build(BuildContext context) {
    final ItemDao _dao=ItemDao();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
      ),
      body: FutureBuilder<List<ItemLista>>(
          initialData: List(),
          future: _dao.Buscatudo(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<ItemLista> itens = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final ItemLista item = itens[index];
                    return CardModelo(item);
                  },
                  itemCount: itens.length,
                );
                break;
            }
            return Text("Unknow error");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FormularioCompra(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardModelo extends StatelessWidget {
  final ItemLista item;

  CardModelo(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          item.Nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          item.Quantidade.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
