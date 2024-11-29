class WallpaperNoPage {
  String? id;
  String? image;
  String? thumbImage;

  WallpaperNoPage({this.id, this.image, this.thumbImage});

  WallpaperNoPage.fromJson(Map<String, dynamic> json) {
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

  static List<WallpaperNoPage> ofWallpapersNoPage(List value) {
    return value.map((e) => WallpaperNoPage.fromJson(e)).toList();
  }
}
