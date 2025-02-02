import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  const RegisterForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: "Name"),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(labelText: "Email"),
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: "Password"),
        ),
        SizedBox(height: 20),
        ElevatedButton(onPressed: onSubmit, child: Text("Register")),
      ],
    );
  }
}
