
import 'package:dartz/dartz.dart';

import '../../../../core/network/network.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParamsUseCase {}