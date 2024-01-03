class StudentModel {
  final String name;
  final String email;
  final int age;
  final int id;

  StudentModel({
    required this.name,
    required this.email,
    required this.age,
    required this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      id: json['id'],
    );
  }

  static List<StudentModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => StudentModel.fromJson(e)).toList();
  }
}
