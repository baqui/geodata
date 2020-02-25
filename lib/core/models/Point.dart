class Point {
  String name;
  String lat;
  String lng;

  Point({
    this.name,
    this.lat,
    this.lng
  });

  Point.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.name;
    data['lng'] = this.lng;
    data['lat'] = this.lat;

    return data;
  }
}