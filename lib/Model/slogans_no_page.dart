class SlogansNoPage {
  String? id;
  String? slogan;

  SlogansNoPage({this.id, this.slogan});

  SlogansNoPage.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    slogan = json["slogan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["slogan"] = slogan;
    return data;
  }

  static List<SlogansNoPage> ofSlogansNoPage(List value) {
    return value.map((e) => SlogansNoPage.fromJson(e)).toList();
  }
}
