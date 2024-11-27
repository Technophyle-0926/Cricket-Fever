class Wallpapers {
  String? id;
  String? image;
  String? thumbImage;

  Wallpapers({this.id, this.image, this.thumbImage});

  Wallpapers.fromJson(Map<String, dynamic> json) {
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

  static List<Wallpapers> ofWallpapers(List value) {
    return value.map((e) => Wallpapers.fromJson(e)).toList();
  }
}
