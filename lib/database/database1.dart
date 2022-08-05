import 'package:foodlist/dao/itemdao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> CreateDabase() async{
  final String path=join(await getDatabasesPath(),"Database.db");
  return openDatabase(path,onCreate: (db,version){
       db.execute(ItemDao.tablesql);
     },version: 1,
     );


}

