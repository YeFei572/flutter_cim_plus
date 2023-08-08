import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constant/enums.dart';
import '../model/chat_record.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  /// id:消息记录id
  /// targetId：对象id，可以是用户id，群id
  /// targetName: 对象名称，可以是用户名称，群名称
  /// avatar： 头像
  /// content：消息内容
  /// msgType：消息类型
  /// createTime：消息创建时间
  /// chatType：记录类别，1表示私聊，2表示群聊
  /// logicType: 逻辑类型，1表示普通聊天记录，2表示通话记录（chat页面的，每次只保留最新的一条记录）
  static Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'cim-plus.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute("""
        CREATE TABLE chat_records (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          targetId INTEGER NOT NULL,
          targetName TEXT NOT NULL,
          avatar TEXT,
          content TEXT NOT NULL,
          msgType INTEGER NOT NULL,
          createTime INTEGER NOT NULL,
          chatType INTEGER NOT NULL CHECK (chatType IN (1, 2)),
          logicType INTEGER NOT NULL CHECK (logicType IN (1, 2))
      );
      
      CREATE INDEX idx_user_id ON chat_records(userId);
        """);
    });
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }

  Future<void> insertRecord(ChatRecord record) async {
    final db = await database;
    // 插入普通聊天记录
    await db.insert('chat_records', record.toJson());
    record.logicType = LogicType.friend.code;
    // 删除旧的逻辑数据并插入新的数据
    await db.delete('chat_records',
        where: 'targetId = ? and logicType = ?',
        whereArgs: [record.targetId, record.logicType]);
    await db.insert('chat_records', record.toJson());
  }

  /// 获取聊天记录列表，逻辑类型，用于展示最近和哪些用户进行聊天
  Future<List<ChatRecord>> getRecordList(
      int page, int size, int logicType) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'chat_records',
      where: 'logicType = ?',
      whereArgs: [
        logicType,
      ],
      orderBy: 'createTime desc',
      limit: page,
      offset: (page - 1) * size,
    );
    return List.generate(
        maps.length, (index) => ChatRecord.fromJson(maps[index]));
  }

  /// 获取指定用户的对话记录
  Future<List<ChatRecord>> getConversionList(
      int page, int size, int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('chat_records',
        where: 'logicType = 1 and targetId = ?',
        whereArgs: [
          userId,
        ],
        orderBy: 'createTime desc',
        limit: page,
        offset: (page - 1) * size);
    return List.generate(
        maps.length, (index) => ChatRecord.fromJson(maps[index]));
  }
}
