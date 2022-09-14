// To parse this JSON data, do
//
//     final objectModel = objectModelFromJson(jsonString);

import 'dart:convert';

List<ObjectModel> objectModelFromJson(String str) => List<ObjectModel>.from(json.decode(str).map((x) => ObjectModel.fromJson(x)));

String objectModelToJson(List<ObjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObjectModel {
  ObjectModel({
    this.title,
    this.iconUrl,
  });

  String? title;
  String? iconUrl;

  factory ObjectModel.fromJson(Map<String, dynamic> json) => ObjectModel(
    title: json["title"] == null ? null : json["title"],
    iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "iconUrl": iconUrl == null ? null : iconUrl,
  };
}
