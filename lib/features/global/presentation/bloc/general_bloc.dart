
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {

  final GetUserInfoUseCase getUserInfoUseCase;
  
  GeneralBloc({
    required this.getUserInfoUseCase
  }) : super(GeneralInitial()) {
    on<GeneralEvent>((event, emit) {
      
    });

    on<GetUserInfoEvent>((event, emit) async {
      emit(await _getUserInfo(emit: emit, event: event,));
    });
  }

  late UserEntity _user;
  UserEntity get user => _user;
  
  Future<GeneralState> _getUserInfo({
    required Emitter<GeneralState> emit, 
    required GetUserInfoEvent event,
  }) async {
    emit (const LoadingState(isLoading: true));
    bool isEnglish = event.languageCode.toUpperCase() == "EN" ? true : false;
    final data = await getUserInfoUseCase(GetUserInfoUseCaseParams(isEnglish: isEnglish));
    return data.fold((failure) {
      emit (const LoadingState(isLoading: false));
      return(FailedGetUserInfoState(
        message:  failure.props.isNotEmpty 
          ? failure.props.first.toString() 
          : ''
      ));
    }, (resp) {
      emit (const LoadingState(isLoading: false));
      _user = resp.result;
      return SuccessGetUserInfoState(userData: resp.result);
    });
  }
}
