import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/register_user.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc(this.registerUser) : super(RegisterInitial()) {
    on<SubmitRegister>((event, emit) async {
      emit(RegisterLoading());

      final success = await registerUser(event.user);
      if (success) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure('Registration failed. Try again.'));
      }
    });
  }
}
