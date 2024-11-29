class RcbImagesNoPage {
  String? id;
  String? image;
  String? thumbImage;

  RcbImagesNoPage({this.id, this.image, this.thumbImage});

  RcbImagesNoPage.fromJson(Map<String, dynamic> json) {
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

  static List<RcbImagesNoPage> ofRcbImagesNoPage(List value) {
    return value.map((e) => RcbImagesNoPage.fromJson(e)).toList();
  }
}
