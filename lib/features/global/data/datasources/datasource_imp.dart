import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jgaviriadev_app/features/global/data/models/user_model.dart';

import '../../../../core/network/network.dart';
import '../../../../core/services/local_db_service.dart';
import 'datasource.dart';

class DatasourceImp implements Datasource {
  final ServerApiClient apiClient;
  final LocalDataBaseService localDataBaseService;
  
  DatasourceImp({
    required this.apiClient,
    required this.localDataBaseService
  });

  @override
  Future<UserModel> getUserInfo({required bool isEnglish}) async{

    final hasConnection = await InternetConnectionChecker().hasConnection.timeout(
      const Duration(seconds: 5),
      onTimeout: () => false,
    );

    if(hasConnection){
      final result = await apiClient.get(
        isEnglish: isEnglish,
      );
      await localDataBaseService.insertUserData(result.body);
      UserModel user = UserModel.fromJson(result.body);
      return user;
    } else {
      UserModel user = await localDataBaseService.getUserInfo(isEnglish);
      return user;
    }
  }
}