class Emp {
  int id;
  String name;
  Emp({this.id, this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  Emp.toObject(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
