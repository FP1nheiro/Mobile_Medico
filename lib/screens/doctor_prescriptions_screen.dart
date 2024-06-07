import 'package:caminho_de_casa/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/prescription.dart';

class DoctorPrescriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthService>().user;
    final prescriptions = context.watch<DataService>().getPrescriptionsForDoctor(currentUser!.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Prescrições Feitas'),
      ),
      body: ListView.builder(
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          final prescription = prescriptions[index];
          return ListTile(
            title: Text('Medicação: ${prescription.medication}'),
            subtitle: Text('Observação: ${prescription.observation}'),
          );
        },
      ),
    );
  }
}
