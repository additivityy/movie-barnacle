class MovieModel {
  String? title;
  int? year;
  List<String>? cast;
  List<String>? genres;
  String? href;
  String? extract;
  String? thumbnail;
  int? thumbnailWidth;
  int? thumbnailHeight;

  MovieModel({
    this.title,
    this.year,
    this.cast,
    this.genres,
    this.href,
    this.extract,
    this.thumbnail,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    cast = json['cast'] != null ? List<String>.from(json['cast']) : null;
    genres = json['genres'] != null ? List<String>.from(json['genres']) : null;
    href = json['href'];
    extract = json['extract'];
    thumbnail = json['thumbnail'];
    thumbnailWidth = json['thumbnail_width'];
    thumbnailHeight = json['thumbnail_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['year'] = year;
    data['cast'] = cast;
    data['genres'] = genres;
    data['href'] = href;
    data['extract'] = extract;
    data['thumbnail'] = thumbnail;
    data['thumbnail_width'] = thumbnailWidth;
    data['thumbnail_height'] = thumbnailHeight;
    return data;
  }
}
