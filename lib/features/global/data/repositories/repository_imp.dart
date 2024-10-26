import 'package:dartz/dartz.dart';

import '../../../../core/network/network.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repository.dart';
import '../../domain/usecases/usecases.dart';
import '../datasources/datasource.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  final Datasource datasource;

  GlobalRepositoryImpl(
    {required this.datasource}
  );

  @override
  Future<Either<Failure, GetUserInfoUseCaseResult>> getUserInfo({required bool isEnglish}) async {
    try {
      final result = await datasource.getUserInfo(isEnglish: isEnglish);
      return Right(
        GetUserInfoUseCaseResult( result: UserEntity.modelToEntity(result)),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on AuthenticationException {
      return Left(AuthenticationFailure());
    } on ConnectionException  catch (e) {
      return Left(ConnectionFailure(message: e.message));
    } on Object catch (e) {
      return Left(ErrorFailure(error: e));
    }
  }
}