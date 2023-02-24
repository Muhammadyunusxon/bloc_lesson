import 'package:flutter_bloc/flutter_bloc.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateState());

  check(String? userName) {
    emit(state.copyWith(userName == "test")) ;
  }
}
