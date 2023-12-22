import 'dart:convert';

CourseListResponseModel courseResponseFromJson(String str) =>
    CourseListResponseModel.fromJson(json.decode(str));

String courseResponseToJson(CourseListResponseModel data) =>
    json.encode(data.toJson());

class CourseListResponseModel {
  int? status;
  String? message;
  List<CourseData>? data;

  CourseListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CourseListResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseListResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CourseData>.from(
                json["data"]!.map((x) => CourseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CourseData {
  String? courseId;
  String? majorName;
  String? courseCategory;
  String? courseName;
  String? urlCover;
  int? jumlahMateri;
  int? jumlahDone;
  int? progress;

  CourseData({
    this.courseId,
    this.majorName,
    this.courseCategory,
    this.courseName,
    this.urlCover,
    this.jumlahMateri,
    this.jumlahDone,
    this.progress,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "major_name": majorName,
        "course_category": courseCategory,
        "course_name": courseName,
        "url_cover": urlCover,
        "jumlah_materi": jumlahMateri,
        "jumlah_done": jumlahDone,
        "progress": progress,
      };
}
