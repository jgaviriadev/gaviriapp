import 'package:get_it/get_it.dart';

import '../../features/global/data/datasources/datasource.dart';
import '../../features/global/data/datasources/datasource_imp.dart';
import '../../features/global/data/repositories/repository_imp.dart';
import '../../features/global/domain/repositories/repository.dart';
import '../../features/global/domain/usecases/usecases.dart';
import '../../features/global/presentation/bloc/general_bloc.dart';
import '../network/network.dart';
import 'local_db_service.dart';


final getIt = GetIt.instance;

Future<void> injectDependencies() async {

  // ---------- blocs ---------- //
  getIt.registerLazySingleton(() => GeneralBloc(
    getUserInfoUseCase: getIt(),
  ));

  // ---------- Server Api clients ---------- //
  getIt.registerLazySingleton(
    () => ServerApiClient(
    ),
  );

  // ---------- Use Cases ---------- //
  getIt.registerLazySingleton(() => GetUserInfoUseCase(repository: getIt()));


  // ---------- Repositories ---------- //
  getIt.registerLazySingleton< GlobalRepository>(
    () => GlobalRepositoryImpl(
      datasource: getIt(), 
    ),
  );

  // ---------- Local DBService ---------- //
  getIt.registerLazySingleton(() => LocalDataBaseService());


  // ---------- Data Sources ---------- //
  getIt.registerLazySingleton<Datasource>(
    () => DatasourceImp(
      apiClient: getIt(),
      localDataBaseService: getIt(),
    ));
}