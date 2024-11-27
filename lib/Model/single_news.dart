class SingleNews {
  String? id;
  String? newsTitle;
  String? newsImage;
  String? thumbImage;
  String? newsDesc;

  SingleNews(
      {this.id,
      this.newsTitle,
      this.newsImage,
      this.thumbImage,
      this.newsDesc});

  SingleNews.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    newsTitle = json["news_title"];
    newsImage = json["news_image"];
    thumbImage = json["thumb_image"];
    newsDesc = json["news_desc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["news_title"] = newsTitle;
    data["news_image"] = newsImage;
    data["thumb_image"] = thumbImage;
    data["news_desc"] = newsDesc;
    return data;
  }

  static List<SingleNews> ofSingleNews(List value) {
    return value.map((e) => SingleNews.fromJson(e)).toList();
  }
}
