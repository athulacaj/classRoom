class RegistrationModel {
  final int id;
  final int student;
  final int subject;

  RegistrationModel({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'],
      student: json['student'],
      subject: json['subject'],
    );
  }
  static List<RegistrationModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => RegistrationModel.fromJson(e)).toList();
  }
}
