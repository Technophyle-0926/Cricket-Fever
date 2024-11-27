class RcbImages {
  String? id;
  String? image;
  String? thumbImage;

  RcbImages({this.id, this.image, this.thumbImage});

  RcbImages.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["thumb_image"] = thumbImage;
    return data;
  }

  static List<RcbImages> ofRcbImages(List value) {
    return value.map((e) => RcbImages.fromJson(e)).toList();
  }
}
