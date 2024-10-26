import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/global/data/models/models.dart';
import '../utils/utils.dart';

class LocalDataBaseService {
  static late Box _database;

  static final LocalDataBaseService db = LocalDataBaseService._internal();

  factory LocalDataBaseService() {
    return db;
  }

  LocalDataBaseService._internal();

  Future<void> initDB() async {
    // Path where the database is stored
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    // Initialize Hive and open the box
    Hive.init(documentDirectory.path);

    _database = await Hive.openBox('GaviriappDB'); // 'MassyDB' is the box name

  }

  // Use this method to access the database box
  Box get database => _database;

  Future insertUserData(String result) async {
    _database.delete("UserInfo"); //If there is old data, delete it
    _database.put("UserInfo", result); //save data in bd
  }

  Future<UserModel> getUserInfo(bool isEnglish) async {
    String? data = _database.get('UserInfo');
    if(data != null){
      return UserModel.fromMap(jsonDecode(data));
    } else {
      data = isEnglish ? offlineData : offlineDataEs;
      return UserModel.fromMap(jsonDecode(data));
    }
  }
}
