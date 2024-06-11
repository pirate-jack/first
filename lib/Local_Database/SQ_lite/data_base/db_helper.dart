import 'package:first/Local_Database/SQ_lite/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
//DB create
  static const DB_NAME = 'Tops Tec.';
  static const DB_VERSION = 1;

//table create
  static const TABLE_NAME = 'user';

//add column
  static final COL_ID = 'id';
  static final COL_FNAME = 'fname';
  static final COL_LNAME = 'lname';
  static final COL_EMAIL = 'email';
  static final COL_CONTACT = 'contact';
  static final COL_COURSE = 'course';
  static final COL_CREATE_AT = 'createAt';

  Dbhelper._internal();
  static final _instance = Dbhelper._internal();

// factory constructor
  factory Dbhelper() {
    return _instance;
  }

  static Database? _database;



  Future<Database?> getDatabase() async {
    _database ??= await createDatabase();
    return _database;
  }

  Future<Database?> createDatabase() async {
    var dbpath = await getDatabasesPath();
    var dbName = 'Tops.Tec';

    var path = join(dbpath, dbName);

    print('path = $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $TABLE_NAME ('
            '$COL_ID INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$COL_FNAME TEXT NOT NULL, '
            '$COL_LNAME TEXT NOT NULL, '
            '$COL_CONTACT TEXT NOT NULL, '
            '$COL_EMAIL TEXT NOT NULL, '
            '$COL_COURSE TEXT NOT NULL, '
            '$COL_CREATE_AT INTEGER)');
      },
    );
  }

  Future<int> insertRecord(User user) async {
    Database? db = await getDatabase();
    if (db != null) {
      return db.insert(TABLE_NAME, user.toMap());
    }
    return -1;
  }

  Future<List<User>> getAllData() async {
    Database? db = await getDatabase();
    List<Map<String, dynamic>> mapList = await db!.query(TABLE_NAME);
    return List.generate(
        mapList.length, (index) => User.fromMap(mapList[index])).toList();
  }

  Future<int> updateRecord(User user) async {
    Database? db = await getDatabase();

    if (db != null) {
      return db.update(TABLE_NAME, user.toMap(),
          where: '$COL_ID = ?', whereArgs: [user.id]);
    }
    return 0;
  }

  Future<int> removeData(int id) async {
    Database? db = await getDatabase();

   return db!.delete(TABLE_NAME,where: '$COL_ID = ?',whereArgs: [id]);
  }
}
