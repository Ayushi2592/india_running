/*import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import '../../data/datasources/profile_remote_data_source.dart';

class GetProfileUseCase {
  late final ProfileRepository repository;

  GetProfileUseCase({required ProfileRepositoryImpl repository}) {
    ProfileRemoteDataSource remoteDataSource = ProfileRemoteDataSourceImpl();

    repository = ProfileRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  Future<Either<Failure, Profile>> call() async {
    return await repository.getProfile();
  }
}

 */
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  // Constructor assigns the repository directly
  GetProfileUseCase({required this.repository});

  Future<Either<Failure, Profile>> call() async {
    return await repository.getProfile();
  }
}

