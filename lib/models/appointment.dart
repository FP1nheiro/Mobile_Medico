class Appointment {
  String doctor;
  DateTime date;
  List<String> times;
  DateTime createdAt;

  Appointment({
    required this.doctor,
    required this.date,
    required this.times,
    required this.createdAt,
  });
}
