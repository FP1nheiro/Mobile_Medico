import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/consultation.dart';

class NurseConsultationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final consultations = context.watch<DataService>().getConsultations();

    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Médicas'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            title: Text('Paciente: ${consultation.patient} - Médico: ${consultation.doctor}'),
            subtitle: Text('Data: ${consultation.date.toLocal()} - Hora: ${consultation.time}'),
            trailing: consultation.date.isBefore(DateTime.now()) ? Text('Concluída', style: TextStyle(color: Colors.red)) : Text('Agendada'),
          );
        },
      ),
    );
  }
}
