import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/nurse.dart';
import '../services/data_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class NurseScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController corenController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Técnico(a) em Enfermagem')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(controller: nameController, labelText: 'Nome Completo'),
            CustomTextField(controller: corenController, labelText: 'COREN'),
            CustomTextField(controller: emailController, labelText: 'Email'),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                final nurse = Nurse(
                  name: nameController.text,
                  coren: corenController.text,
                  email: emailController.text,
                  photo: '', // Aqui você pode adicionar lógica para selecionar uma foto
                  createdAt: DateTime.now(),
                );
                context.read<DataService>().addNurse(nurse);
                Navigator.pop(context);
              },
              text: 'Salvar',
            ),
          ],
        ),
      ),
    );
  }
}
