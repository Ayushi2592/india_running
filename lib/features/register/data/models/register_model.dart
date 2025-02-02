import '../../domain/entities/register_repository.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.name,
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
