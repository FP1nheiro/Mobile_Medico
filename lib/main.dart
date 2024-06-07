import 'package:caminho_de_casa/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_patient.dart';
import 'screens/home_doctor.dart';
import 'screens/home_nurse.dart';
import 'screens/registration_screen.dart';
import 'screens/patient_screen.dart';
import 'screens/doctor_screen.dart';
import 'screens/nurse_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/consultation_screen.dart';
import 'screens/medication_screen.dart';
import 'screens/prescription_screen.dart';
import 'screens/schedule_consultation_screen.dart';
import 'screens/view_consultations_screen.dart';
import 'screens/prescribe_medication_screen.dart';
import 'screens/doctor_schedule_screen.dart';
import 'screens/nurse_consultations_screen.dart';
import 'screens/nurse_medications_screen.dart';
import 'screens/patient_agenda_screen.dart';
import 'screens/patient_medications_screen.dart';
import 'screens/patient_prescriptions_screen.dart';
import 'screens/patient_history_screen.dart';
import 'screens/doctor_patients_screen.dart';
import 'screens/doctor_prescriptions_screen.dart';
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
        home: SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => Consumer<AuthService>(
            builder: (context, auth, _) {
              if (auth.user != null) {
                switch (auth.user!.type) {
                  case UserType.patient:
                    return HomePatient();
                  case UserType.doctor:
                    return HomeDoctor();
                  case UserType.nurse:
                    return HomeNurse();
                }
              } else {
                return LoginScreen();
              }
            },
          ),
          '/registration': (context) => RegistrationScreen(),
          '/patients': (context) => PatientScreen(),
          '/doctors': (context) => DoctorScreen(),
          '/nurses': (context) => NurseScreen(),
          '/appointments': (context) => AppointmentScreen(),
          '/consultations': (context) => ConsultationScreen(),
          '/medications': (context) => MedicationScreen(),
          '/prescriptions': (context) => PrescriptionScreen(),
          '/schedule_consultation': (context) => ScheduleConsultationScreen(),
          '/view_consultations': (context) => ViewConsultationsScreen(),
          '/prescribe_medication': (context) => PrescribeMedicationScreen(),
          '/doctor_schedule': (context) => DoctorScheduleScreen(),
          '/nurse_consultations': (context) => NurseConsultationsScreen(),
          '/nurse_medications': (context) => NurseMedicationsScreen(),
          '/patient_agenda': (context) => PatientAgendaScreen(),
          '/patient_medications': (context) => PatientMedicationsScreen(),
          '/patient_prescriptions': (context) => PatientPrescriptionsScreen(),
          '/patient_history': (context) => PatientHistoryScreen(),
          '/doctor_patients': (context) => DoctorPatientsScreen(),
          '/doctor_prescriptions': (context) => DoctorPrescriptionsScreen(),
        },
      ),
    );
  }
}
