part of 'validate_cubit.dart';

class ValidateState {
   bool isTrue;

  ValidateState({ this.isTrue = true});
  ValidateState copyWith(bool? text){
    return ValidateState(isTrue: text ?? isTrue);
  }
}
