import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflitedb/Emp.dart';

class DBHelper {
  String id = 'id';
  String name = 'name';
  String table = 'emp';
  String db_name = 'employee.db';

  Database _DB;

  initialDB() async {
    var path = join(await getDatabasesPath(), db_name);
    var db = openDatabase(path, version: 1,
        onCreate: (Database database, int version) {
      database
          .execute("CREATE TABLE $table($id INTEGER PRIMARY KEY, $name TEXT)");
    });
    return db;
  }

  Future<Database> get db async {
    if (_DB != null) {
      return _DB;
    }
    _DB = await initialDB();
    return _DB;
  }

  saveData(Emp data) async {
    var ins = await db;
    data.id = await ins.insert(table, data.toMap());
    return data;
  }

  getEmp() async {
    var qu = await db;
    List<Map> maps = await qu.query(table, columns: [id, name]);
    List<Emp> emps = [];
    for (int i = 0; i < maps.length; i++) {
      emps.add(Emp.toObject(maps[i]));
    }
    return emps;
  }

  delEmp(int id) async {
    var del = await db;
    return await del.delete(table, where: '$id = ?', whereArgs: [id]);
  }

  close() async {
    var c = await db;
    c.close();
  }
}
