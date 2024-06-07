import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/consultation.dart';
import '../services/data_service.dart';
import '../services/auth_service.dart';

class DoctorScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthService>().user;
    final consultations = context.watch<DataService>().getConsultationsForDoctor(currentUser!.name);

    final times = ['09:00', '10:00', '11:00', '14:00', '15:00', '16:00'];
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('Horários Disponíveis'),
      ),
      body: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          final time = times[index];
          final hasConsultation = consultations.any((consultation) => consultation.time == time && consultation.date.day == today.day && consultation.date.month == today.month && consultation.date.year == today.year);
          return ListTile(
            title: Text('Horário: $time'),
            trailing: hasConsultation ? Text('Ocupado', style: TextStyle(color: Colors.red)) : Text('Disponível'),
          );
        },
      ),
    );
  }
}
