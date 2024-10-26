import 'package:dartz/dartz.dart';

import '../../../../../../core/network/failure.dart';
import '../usecases/usecases.dart';

abstract class GlobalRepository {
  Future<Either<Failure, GetUserInfoUseCaseResult>> getUserInfo({required bool isEnglish});
}
