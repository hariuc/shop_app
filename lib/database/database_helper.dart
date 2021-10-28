import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shop_app/database/product_table_setting.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = directory.path + 'database.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(ProductTableSetting.createProductTable());
  }
}
