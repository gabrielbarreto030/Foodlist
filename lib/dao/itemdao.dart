import 'package:foodlist/database/database.dart';
import 'package:foodlist/model/ItemLista.dart';
import 'package:sqflite/sqlite_api.dart';

class ItemDao {
  static const String tablesql="CREATE TABLE $tablename("
  "${_id} INTEGER PRIMARY KEY, "
  "${_produto} TEXT, "
  "${_quantidade} INTEGER) ";
  static const String tablename="listadeprodutos";
  static const String _id="id";
  static const String _produto="produto";
  static const String _quantidade="quantidade";
  Future<int> Salva(ItemLista item) async {
    final Database db = await CreateDabase();
    Map<String, dynamic> Mapitem = ToMap(item);
    return db.insert(tablename, Mapitem);
  }

  Map<String, dynamic> ToMap(ItemLista item) {
    final Map<String, dynamic> Mapitem = Map();
    Mapitem[_produto] = item.Nome;
    Mapitem[_quantidade] = item.Quantidade;
    return Mapitem;
  }

  Future<List<ItemLista>> Buscatudo() async {
    final Database db = await CreateDabase();
    final List<Map<String, dynamic>> result = await db.query(tablename);
    List<ItemLista> itemlistado = ToList(result);
    return itemlistado;
  }

  List<ItemLista> ToList(List<Map<String, dynamic>> result) {
    final List<ItemLista> itemlistado = List();
    for (Map<String, dynamic> row in result) {
      final ItemLista item =
          ItemLista(row[_id], row[_produto], row[_quantidade]);
      itemlistado.add(item);
    }
    return itemlistado;
  }
}
