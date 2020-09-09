class Thumbnail {
  String path;
  String extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}