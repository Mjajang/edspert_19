import 'dart:convert';

class BannerResponseModel {
  int? status;
  String? message;
  List<BannerDataModel>? data;

  BannerResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) =>
      BannerResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BannerDataModel>.from(
                json["data"].map((x) => BannerDataModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BannerDataModel {
  String? eventId;
  String? eventTitle;
  String? eventDescription;
  String? eventImage;
  String? eventUrl;

  BannerDataModel({
    this.eventId,
    this.eventTitle,
    this.eventDescription,
    this.eventImage,
    this.eventUrl,
  });

  factory BannerDataModel.fromJson(String str) =>
      BannerDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerDataModel.fromMap(Map<String, dynamic> json) => BannerDataModel(
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
