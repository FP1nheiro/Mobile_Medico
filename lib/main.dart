import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/patient_screen.dart';
import 'screens/doctor_screen.dart';
import 'screens/nurse_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/consultation_screen.dart';
import 'services/auth_service.dart';
import 'services/data_service.dart';

void main() {
  runApp(MedicosCZApp());
}

class MedicosCZApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => DataService()),
      ],
      child: MaterialApp(
        title: 'Médicos CZ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          '/home': (context) => HomeScreen(),
          '/patients': (context) => PatientScreen(),
          '/doctors': (context) => DoctorScreen(),
          '/nurses': (context) => NurseScreen(),
          '/appointments': (context) => AppointmentScreen(),
          '/consultations': (context) => ConsultationScreen(),
        },
      ),
    );
  }
}
