import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../utils/validators.dart';
import '../models/user.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/background_animation.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                'Login',
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
                onPressed: () async {
                  if (!isValidEmail(emailController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email inválido')),
                    );
                    return;
                  }

                  if (selectedUserType == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selecione um tipo de usuário')),
                    );
                    return;
                  }

                  try {
                    await context.read<AuthService>().login(emailController.text, passwordController.text, selectedUserType!);
                    Navigator.pushNamed(context, '/home');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Falha na autenticação')),
                    );
                  }
                },
                text: 'Login',
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
                child: Text(
                  'Não tem uma conta? Registre-se',
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
