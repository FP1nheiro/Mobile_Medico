import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data_service.dart';
import '../models/consultation.dart';
import '../services/auth_service.dart';

class ViewConsultationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthService>().user;
    final consultations = context.watch<DataService>().getConsultationsForDoctor(currentUser!.name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Agendadas'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return ListTile(
            title: Text('Paciente: ${consultation.patient}'),
            subtitle: Text('Data: ${consultation.date.toLocal()} - Hora: ${consultation.time}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/prescribe_medication', arguments: consultation);
              },
              child: Text('Atender'),
            ),
          );
        },
      ),
    );
  }
}
