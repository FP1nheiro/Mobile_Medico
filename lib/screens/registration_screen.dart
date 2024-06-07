import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/background_animation.dart';
import '../models/user.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  UserType? selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundAnimation(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Registro',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(controller: emailController, labelText: 'Email'),
              SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                labelText: 'Senha',
                obscureText: true,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: confirmPasswordController,
                labelText: 'Confirmar Senha',
                obscureText: true,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<UserType>(
                hint: Text("Selecione o tipo de usuário"),
                items: UserType.values.map((UserType type) {
                  return DropdownMenuItem<UserType>(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (UserType? newValue) {
                  selectedUserType = newValue;
                },
                validator: (value) => value == null ? "Selecione um tipo de usuário" : null,
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (!isValidEmail(emailController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email inválido')),
                    );
                    return;
                  }
                  if (passwordController.text != confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Senhas não coincidem')),
                    );
                    return;
                  }

                  if (selectedUserType == null || selectedUserType != UserType.patient) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Somente pacientes podem se registrar')),
                    );
                    return;
                  }

                  // Registro do usuário (simulado)
                  Navigator.pushReplacementNamed(context, '/login');
                },
                text: 'Registrar',
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Já tem uma conta? Faça login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
