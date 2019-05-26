import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/record_model.dart';

class DbHelper {
  static final _dbName = "FlutterWallet.db";
  static final _dbVersion = 1;

  static final table = "record_model_table";

  static final columnId = "id";
  static final columnSum = "sum";
  static final columnPaymentType = "payment_type";
  static final columnCategory = "category";
  static final columnLabels = "labels";
  static final columnPayee = "payee";
  static final columnDate = "date";
  static final columnTime = "time";
  static final columnStatus = "status";
  static final columnWarranty = "warranty";

  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
    $columnId INTEGER PRIMARY KEY,
    $columnSum REAL,
    $columnPaymentType TEXT,
    $columnCategory TEXT,
    $columnLabels TEXT,
    $columnPayee TEXT,
    $columnDate TEXT,
    $columnTime TEXT,
    $columnStatus TEXT,
    $columnWarranty TEXT)
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM $table"));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<void> insertRecord(RecordModel recordModel) async {
    final Database db = await instance.database;
    await db.insert(
      table,
      recordModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RecordModel>> getRecords() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(
      maps.length,
      (i) {
        return RecordModel(
          maps[i]['id'],
          maps[i]['labels'],
          maps[i]['payee'],
          maps[i]['date'],
          maps[i]['time'],
          maps[i]['status'],
          maps[i]['warranty'],
          maps[i]['sum'],
          maps[i]['payment_type'],
          maps[i]['category'],
        );
      },
    );
  }
}
