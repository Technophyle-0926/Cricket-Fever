class Family {
  String? id;
  String? image;
  String? title;
  String? thumbImage;

  Family({this.id, this.image, this.title, this.thumbImage});

  Family.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    title = json["title"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["title"] = title;
    data["thumb_image"] = thumbImage;
    return data;
  }

  static List<Family> ofFamily(List value) {
    return value.map((e) => Family.fromJson(e)).toList();
  }
}
