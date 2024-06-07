class Medication {
  String name;
  String presentation;
  int quantity;
  int days;
  DateTime createdAt;
  DateTime updatedAt;

  Medication({
    required this.name,
    required this.presentation,
    required this.quantity,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
  });
}
