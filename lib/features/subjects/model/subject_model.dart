class SubjectModel {
  final int id;
  final String name;
  final String teacher;
  final int credits;

  SubjectModel({
    required this.id,
    required this.name,
    required this.teacher,
    required this.credits,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      teacher: json['teacher'],
      credits: json['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'teacher': teacher,
      'credits': credits,
    };
  }

  static List<SubjectModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SubjectModel.fromJson(json)).toList();
  }
}
