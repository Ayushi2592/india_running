import '../entities/register_repository.dart';
import '../repositories/register_repository.dart';

class RegisterUser {
  final RegisterRepository repository;

  RegisterUser(this.repository);

  Future<bool> call(RegisterEntity user) async {
    return await repository.registerUser(user);
  }
}




