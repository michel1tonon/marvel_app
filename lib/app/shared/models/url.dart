class Url {
  String type;
  String url;

  Url.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}