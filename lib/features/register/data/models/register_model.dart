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



/*import 'package:india_running/features/register/domain/entities/register_repository.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required String name,
    required String price,
    required String details,
  }) : super(name: name, price: price, details: details);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      price: json['price'],
      details: json['details'],
    );
  }
}
*/

