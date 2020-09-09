class Event {
  int available;
  String collectionURI;
  List<Item> items;
  int returned;

  Event.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = new List<Item>();
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
      });
    }
    returned = json['returned'];
  }
}

class Item {
  String resourceURI;
  String name;
  String type;

  Item.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }
}