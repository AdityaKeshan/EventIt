import 'dart:convert';

EventData eventDataFromJson(String str) => EventData.fromJson(json.decode(str));

String eventDataToJson(EventData data) => json.encode(data.toJson());

class EventData {
  EventData({
    this.date,
    this.description,
    this.fee,
    this.keywords,
    this.time,
    this.title,
    this.rating,
  });

  String date;
  String description;
  String fee;
  String rating;
  String keywords;
  String time;
  String title;

  factory EventData.fromJson(Map<String, dynamic> json) => EventData(
    date: json["date"],
    description: json["description"],
    fee: json["fee"],
    keywords: json["keywords"],
    time: json["time"],
    title: json["title"],
    rating: json['rating'],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "description": description,
    "fee": fee,
    "keywords": keywords,
    "time": time,
    "title": title,
    "rating":rating,
  };
}
