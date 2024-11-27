class Slogans {
  String? id;
  String? slogan;

  Slogans({this.id, this.slogan});

  Slogans.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    slogan = json["slogan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["slogan"] = slogan;
    return data;
  }

  static List<Slogans> ofSlogans(List value) {
    return value.map((e) => Slogans.fromJson(e)).toList();
  }
}
