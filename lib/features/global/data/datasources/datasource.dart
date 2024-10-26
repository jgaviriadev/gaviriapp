

import '../models/models.dart';

abstract class Datasource {

  //get user info
  Future<UserModel> getUserInfo({required bool isEnglish});
}
