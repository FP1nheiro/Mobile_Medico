import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(controller: emailController, labelText: 'Email'),
            CustomTextField(
              controller: passwordController,
              labelText: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                context.read<AuthService>().login(emailController.text, passwordController.text);
                Navigator.pushReplacementNamed(context, '/home');
              },
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
