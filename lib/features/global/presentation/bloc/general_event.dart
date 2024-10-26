part of 'general_bloc.dart';

abstract class GeneralEvent extends Equatable {
  const GeneralEvent();

  @override
  List<Object> get props => [];
}


class GetUserInfoEvent extends GeneralEvent {
  final String languageCode;
  const GetUserInfoEvent({required this.languageCode});
  @override
  List<Object> get props => [];
}