import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/patient.dart';
import '../services/data_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class PatientScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Paciente')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(controller: nameController, labelText: 'Nome Completo'),
            CustomTextField(controller: cpfController, labelText: 'CPF'),
            CustomTextField(controller: emailController, labelText: 'Email'),
            CustomTextField(controller: birthDateController, labelText: 'Data de Nascimento'),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                final patient = Patient(
                  name: nameController.text,
                  cpf: cpfController.text,
                  email: emailController.text,
                  birthDate: DateTime.parse(birthDateController.text),
                  photo: '', // Aqui você pode adicionar lógica para selecionar uma foto
                  createdAt: DateTime.now(),
                );
                context.read<DataService>().addPatient(patient);
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
