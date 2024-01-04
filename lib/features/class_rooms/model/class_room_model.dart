// {"id":1,"layout":"classroom","name":"LightSeaGreen","size":21}
class ClassRoomModel {
  final int id;
  final String layout;
  final String name;
  final int size;

  ClassRoomModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      id: json['id'],
      layout: json['layout'],
      name: json['name'],
      size: json['size'],
    );
  }
  static List<ClassRoomModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => ClassRoomModel.fromJson(e)).toList();
  }
}
