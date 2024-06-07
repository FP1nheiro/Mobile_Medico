import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/doctor.dart';
import '../services/data_service.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class DoctorScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController crmController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Médico')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomTextField(controller: nameController, labelText: 'Nome Completo'),
            CustomTextField(controller: crmController, labelText: 'CRM'),
            CustomTextField(controller: specialtyController, labelText: 'Especialidade'),
            CustomTextField(controller: emailController, labelText: 'Email'),
            SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                final doctor = Doctor(
                  name: nameController.text,
                  crm: crmController.text,
                  specialty: specialtyController.text,
                  email: emailController.text,
                  photo: '', // Aqui você pode adicionar lógica para selecionar uma foto
                  createdAt: DateTime.now(),
                );
                context.read<DataService>().addDoctor(doctor);
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
