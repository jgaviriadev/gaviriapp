import 'package:dartz/dartz.dart';

import '../../../../../../core/network/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/repository.dart';
import 'usecases.dart';

class GetUserInfoUseCase implements UseCase<GetUserInfoUseCaseResult, GetUserInfoUseCaseParams> {
  final GlobalRepository repository;

  GetUserInfoUseCase({required this.repository});

  @override
  Future<Either<Failure, GetUserInfoUseCaseResult>> call(params) async {
    final result = await repository.getUserInfo(isEnglish: params.isEnglish);
    return result.fold((failure) => Left(failure),
        (resp) => Right(GetUserInfoUseCaseResult(result: resp.result)));
  }
}

class GetUserInfoUseCaseResult {
  final UserEntity result;

  const GetUserInfoUseCaseResult({required this.result});
}

class GetUserInfoUseCaseParams {
  final bool isEnglish;
  const GetUserInfoUseCaseParams({required this.isEnglish});
}
