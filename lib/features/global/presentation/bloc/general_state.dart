part of 'general_bloc.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();  

  @override
  List<Object> get props => [];
}
class GeneralInitial extends GeneralState {}


class FailedGetUserInfoState extends GeneralState {
  final String message;
  const FailedGetUserInfoState({
    required this.message,
  });
}

class SuccessGetUserInfoState extends GeneralState {
  final UserEntity userData;
  const SuccessGetUserInfoState({required this.userData});
}

class LoadingState extends GeneralState {
  final bool isLoading;
  const LoadingState({
    required this.isLoading,
  });

  @override
  List<Object> get props => [isLoading];
}