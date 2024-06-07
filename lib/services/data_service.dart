import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../models/consultation.dart';
import '../models/doctor.dart';
import '../models/medication.dart';
import '../models/nurse.dart';
import '../models/patient.dart';
import '../models/prescription.dart';
import '../models/specialty.dart';
import '../models/medication_presentation.dart';
class DataService extends ChangeNotifier {
  List<Patient> _patients = [];
  List<Doctor> _doctors = [];
  List<Nurse> _nurses = [];
  List<Appointment> _appointments = [];
  List<Consultation> _consultations = [];
  List<Prescription> _prescriptions = [];
  List<Medication> _medications = [];
  List<Specialty> _specialties = [];
  List<MedicationPresentation> _presentations = [];

  DataService() {
    _addInitialDoctors();
  }

  void _addInitialDoctors() {
    _doctors = [
      Doctor(
        name: "Dr. João",
        crm: "12345",
        specialty: "Cardiologia",
        photo: "assets/images/doctor1.jpg",
        email: "doctor1@example.com",
        createdAt: DateTime.now(),
      ),
      Doctor(
        name: "Dr. Maria",
        crm: "67890",
        specialty: "Dermatologia",
        photo: "assets/images/doctor2.jpg",
        email: "doctor2@example.com",
        createdAt: DateTime.now(),
      ),
    ];
  }

  // Patient CRUD operations
  void addPatient(Patient patient) {
    _patients.add(patient);
    notifyListeners();
  }

  void updatePatient(Patient updatedPatient) {
    final index = _patients.indexWhere((patient) => patient.cpf == updatedPatient.cpf);
    if (index != -1) {
      _patients[index] = updatedPatient;
      notifyListeners();
    }
  }

  void deletePatient(String cpf) {
    _patients.removeWhere((patient) => patient.cpf == cpf);
    notifyListeners();
  }

  List<Patient> getPatients() {
    return _patients;
  }

  // Doctor CRUD operations
  void addDoctor(Doctor doctor) {
    _doctors.add(doctor);
    notifyListeners();
  }

  void updateDoctor(Doctor updatedDoctor) {
    final index = _doctors.indexWhere((doctor) => doctor.crm == updatedDoctor.crm);
    if (index != -1) {
      _doctors[index] = updatedDoctor;
      notifyListeners();
    }
  }

  void deleteDoctor(String crm) {
    _doctors.removeWhere((doctor) => doctor.crm == crm);
    notifyListeners();
  }

  List<Doctor> getDoctors() {
    return _doctors;
  }

  // Nurse CRUD operations
  void addNurse(Nurse nurse) {
    _nurses.add(nurse);
    notifyListeners();
  }

  void updateNurse(Nurse updatedNurse) {
    final index = _nurses.indexWhere((nurse) => nurse.coren == updatedNurse.coren);
    if (index != -1) {
      _nurses[index] = updatedNurse;
      notifyListeners();
    }
  }

  void deleteNurse(String coren) {
    _nurses.removeWhere((nurse) => nurse.coren == coren);
    notifyListeners();
  }

  List<Nurse> getNurses() {
    return _nurses;
  }

  // Appointment CRUD operations
  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners();
  }

  void updateAppointment(Appointment updatedAppointment) {
    final index = _appointments.indexWhere((appointment) => appointment.date == updatedAppointment.date && appointment.doctor == updatedAppointment.doctor);
    if (index != -1) {
      _appointments[index] = updatedAppointment;
      notifyListeners();
    }
  }

  void deleteAppointment(String doctor, DateTime date) {
    _appointments.removeWhere((appointment) => appointment.doctor == doctor && appointment.date == date);
    notifyListeners();
  }

  List<Appointment> getAppointments() {
    return _appointments;
  }

  // Consultation CRUD operations
  void addConsultation(Consultation consultation) {
    _consultations.add(consultation);
    notifyListeners();
  }

  void updateConsultation(Consultation updatedConsultation) {
    final index = _consultations.indexWhere((consultation) => consultation.date == updatedConsultation.date && consultation.time == updatedConsultation.time && consultation.doctor == updatedConsultation.doctor && consultation.patient == updatedConsultation.patient);
    if (index != -1) {
      _consultations[index] = updatedConsultation;
      notifyListeners();
    }
  }

  void deleteConsultation(String doctor, DateTime date, String time, String patient) {
    _consultations.removeWhere((consultation) => consultation.doctor == doctor && consultation.date == date && consultation.time == time && consultation.patient == patient);
    notifyListeners();
  }

  List<Consultation> getConsultations() {
    return _consultations;
  }

  List<Consultation> getConsultationsForDoctor(String doctor) {
    return _consultations.where((consultation) => consultation.doctor == doctor).toList();
  }

  List<Consultation> getConsultationsForPatient(String patient) {
    return _consultations.where((consultation) => consultation.patient == patient).toList();
  }

  // Prescription CRUD operations
  void addPrescription(Prescription prescription) {
    _prescriptions.add(prescription);
    notifyListeners();
  }

  void updatePrescription(Prescription updatedPrescription) {
    final index = _prescriptions.indexWhere((prescription) => prescription.consultation == updatedPrescription.consultation && prescription.medication == updatedPrescription.medication);
    if (index != -1) {
      _prescriptions[index] = updatedPrescription;
      notifyListeners();
    }
  }

  void deletePrescription(String consultation, String medication) {
    _prescriptions.removeWhere((prescription) => prescription.consultation == consultation && prescription.medication == medication);
    notifyListeners();
  }

  List<Prescription> getPrescriptions() {
    return _prescriptions;
  }

  List<Prescription> getPrescriptionsForDoctor(String doctor) {
    return _prescriptions.where((prescription) => _consultations.any((consultation) => consultation.date.toString() == prescription.consultation && consultation.doctor == doctor)).toList();
  }

  List<Prescription> getPrescriptionsForPatient(String patient) {
    return _prescriptions.where((prescription) => _consultations.any((consultation) => consultation.date.toString() == prescription.consultation && consultation.patient == patient)).toList();
  }

  // Medication CRUD operations
  void addMedication(Medication medication) {
    _medications.add(medication);
    notifyListeners();
  }

  void updateMedication(Medication updatedMedication) {
    final index = _medications.indexWhere((medication) => medication.name == updatedMedication.name && medication.presentation == updatedMedication.presentation);
    if (index != -1) {
      _medications[index] = updatedMedication;
      notifyListeners();
    }
  }

  void deleteMedication(String name, String presentation) {
    _medications.removeWhere((medication) => medication.name == name && medication.presentation == presentation);
    notifyListeners();
  }

  List<Medication> getMedications() {
    return _medications;
  }

  // Specialty CRUD operations
  void addSpecialty(Specialty specialty) {
    _specialties.add(specialty);
    notifyListeners();
  }

  List<Specialty> getSpecialties() {
    return _specialties;
  }

  // Medication Presentation CRUD operations
  void addPresentation(MedicationPresentation presentation) {
    _presentations.add(presentation);
    notifyListeners();
  }

  List<MedicationPresentation> getPresentations() {
    return _presentations;
  }
}
