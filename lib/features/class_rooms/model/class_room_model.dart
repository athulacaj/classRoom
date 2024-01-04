// ignore_for_file: public_member_api_docs, sort_constructors_first
// {"id":1,"layout":"classroom","name":"LightSeaGreen","size":21}
class ClassRoomModel {
  final int id;
  final String layout;
  final String name;
  final int size;
  final dynamic subject;

  ClassRoomModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    this.subject,
  });

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      id: json['id'],
      layout: json['layout'],
      name: json['name'],
      size: json['size'],
      subject: json['subject'],
    );
  }
  static List<ClassRoomModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => ClassRoomModel.fromJson(e)).toList();
  }

  ClassRoomModel copyWith({
    int? id,
    String? layout,
    String? name,
    int? size,
    dynamic subject,
  }) {
    return ClassRoomModel(
      id: id ?? this.id,
      layout: layout ?? this.layout,
      name: name ?? this.name,
      size: size ?? this.size,
      subject: subject ?? this.subject,
    );
  }
}
