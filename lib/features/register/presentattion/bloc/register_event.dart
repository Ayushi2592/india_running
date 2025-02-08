/*import '../../domain/entities/register_repository.dart';

abstract class RegisterEvent {}

class SubmitRegister extends RegisterEvent {
  final RegisterEntity user;

  SubmitRegister(this.user);
}
*/
part of 'register_bloc.dart';

abstract class RegisterEvent {}

class LoadCategoriesEvent extends RegisterEvent {}


