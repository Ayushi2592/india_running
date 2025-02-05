//import 'package:flutter_bloc/flutter_bloc.dart';
//import '../../domain/usecases/register_user.dart';
//import 'register_event.dart';
//import 'register_state.dart';

//class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //final RegisterUser registerUser;

  //RegisterBloc(this.registerUser) : super(RegisterInitial()) {
    //on<SubmitRegister>((event, emit) async {
      //emit(RegisterLoading());

      //final success = await registerUser(event.user);
      //if (success) {
        //emit(RegisterSuccess());
      //} else {
        //emit(RegisterFailure('Registration failed. Try again.'));
      //}
    //});
  //}
//}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class SelectCategoryEvent extends RegisterEvent {
  final String category;

  const SelectCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

// States
abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {}

class CategorySelectedState extends RegisterState {
  final String selectedCategory;

  const CategorySelectedState(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];
}

// BLoC
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState());

  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is SelectCategoryEvent) {
      yield CategorySelectedState(event.category);
    }
  }
}

