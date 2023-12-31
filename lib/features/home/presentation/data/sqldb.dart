import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'bookStore.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        'CREATE TABLE "BookStoreApp" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,"title" Text NOT NULL, "author" Text NOT NULL ,"coverUrl" Text NOT NULL)');
    batch.commit();
    print('onCreate=================================');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('_onUpgrade=================================');
  }


  Future<List<Map>?> read() async {
    Database? myDb = await db;
    List<Map>? response = await myDb?.query("BookStoreApp");
    return response;
  }

  insert(String title,String author,String coverUrl,) async {
    Database? myDb = await db;
    int? response = await myDb?.insert(
      "BookStoreApp",
      {
        'title': title,
        'author': author,
        'coverUrl': coverUrl,
      },
    );
    return response;
  }

  delete(int id) async {
    Database? myDb = await db;
    int? response = await myDb?.delete("BookStoreApp", where: 'id =$id');
    return response;
  }


  deleteMyDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'bookStore.db');
    await deleteDatabase(path);
  }

}
