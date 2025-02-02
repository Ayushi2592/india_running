import '../entities/register_repository.dart';

abstract class RegisterRepository {
  Future<bool> registerUser(RegisterEntity user);
}
