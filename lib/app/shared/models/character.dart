import 'package:marvel_app/app/shared/models/event.dart';
import 'package:marvel_app/app/shared/models/thumbnail.dart';
import 'package:marvel_app/app/shared/models/url.dart';

class Character {
  int id;
  String name;
  String _description;
  String modified;
  Thumbnail thumbnail;
  String resourceURI;
  Event comics;
  Event series;
  Event stories;
  Event events;
  List<Url> urls;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    _description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
    json['comics'] != null ? new Event.fromJson(json['comics']) : null;
    series =
    json['series'] != null ? new Event.fromJson(json['series']) : null;
    stories =
    json['stories'] != null ? new Event.fromJson(json['stories']) : null;
    events =
    json['events'] != null ? new Event.fromJson(json['events']) : null;
    if (json['urls'] != null) {
      urls = new List<Url>();
      json['urls'].forEach((v) {
        urls.add(new Url.fromJson(v));
      });
    }
  }

  String get description {
    return _description.isNotEmpty ? _description: "No description";
  }
}
