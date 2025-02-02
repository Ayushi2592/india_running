import '../../domain/entities/register_repository.dart';

abstract class RegisterEvent {}

class SubmitRegister extends RegisterEvent {
  final RegisterEntity user;

  SubmitRegister(this.user);
}
