import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../services/auth_service.dart';

class PatientHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthService>().user;
    final consultations = context.watch<DataService>().getConsultationsForPatient(currentUser!.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Consultas'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            title: Text('Médico: ${consultation.doctor}'),
            subtitle: Text('Data: ${consultation.date.toLocal()} - Hora: ${consultation.time}'),
          );
        },
      ),
    );
  }
}
