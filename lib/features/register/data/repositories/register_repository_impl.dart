import '../../domain/entities/register_repository.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_sources/register_remote_data_source.dart';
import '../models/register_model.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<bool> registerUser(RegisterEntity user) async {
    final model = RegisterModel(
      name: user.name,
      email: user.email,
      password: user.password,
    );
    return await dataSource.registerUser(model);
  }
}




