import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/profile_remote_data_source.dart';
import '../../domain/usecaese/get_profile_usecases.dart';
import '../../domain/entities/profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../../data/repositories/profile_repository_impl.dart'; // Import concrete repository


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late final GetProfileUseCase getProfileUseCase;

  ProfileBloc() : super(ProfileInitial()) {
    // Manually instantiate ProfileRemoteDataSourceImpl
    final profileRemoteDataSource = ProfileRemoteDataSourceImpl();

    // Pass ProfileRemoteDataSourceImpl to ProfileRepositoryImpl
    final profileRepository = ProfileRepositoryImpl(remoteDataSource: profileRemoteDataSource);

    // Instantiate GetProfileUseCase with the profileRepository
    getProfileUseCase = GetProfileUseCase(repository: profileRepository);

    on<LoadProfileEvent>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());

    final Either<Failure, Profile> result = await getProfileUseCase();

    result.fold(
          (failure) => emit(ProfileError(message: _mapFailureToMessage(failure))),
          (profile) => emit(ProfileLoaded(profile: profile)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server error occurred';
    } else if (failure is CacheFailure) {
      return 'Failed to load data from cache';
    } else {
      return 'Unexpected error';
    }
  }
}
