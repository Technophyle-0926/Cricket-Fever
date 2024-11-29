class QuotesNoPage {
  String? id;
  String? image;
  String? thumbImage;

  QuotesNoPage({this.id, this.image, this.thumbImage});

  QuotesNoPage.fromJson(Map<String, dynamic> json) {
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

  static List<QuotesNoPage> ofQuotesNoPage(List value) {
    return value.map((e) => QuotesNoPage.fromJson(e)).toList();
  }
}
