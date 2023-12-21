import 'dart:convert';

class BannerResponse {
  int? status;
  String? message;
  List<BannerData>? data;

  BannerResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BannerData>.from(
                json["data"].map((x) => BannerData.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BannerData {
  String? eventId;
  String? eventTitle;
  String? eventDescription;
  String? eventImage;
  String? eventUrl;

  BannerData({
    this.eventId,
    this.eventTitle,
    this.eventDescription,
    this.eventImage,
    this.eventUrl,
  });

  factory BannerData.fromJson(String str) =>
      BannerData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerData.fromMap(Map<String, dynamic> json) => BannerData(
        eventId: json["event_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        eventImage: json["event_image"],
        eventUrl: json["event_url"],
      );

  Map<String, dynamic> toMap() => {
        "event_id": eventId,
        "event_title": eventTitle,
        "event_description": eventDescription,
        "event_image": eventImage,
        "event_url": eventUrl,
      };
}
