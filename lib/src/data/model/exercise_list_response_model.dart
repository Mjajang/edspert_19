// To parse this JSON data, do
//
//     final exerciseResponse = exerciseResponseFromJson(jsonString);

import 'dart:convert';

ExerciseListResponseModel exerciseResponseFromJson(String str) =>
    ExerciseListResponseModel.fromJson(json.decode(str));

String exerciseResponseToJson(ExerciseListResponseModel data) =>
    json.encode(data.toJson());

class ExerciseListResponseModel {
  int? status;
  String? message;
  List<ExerciseData>? data;

  ExerciseListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ExerciseListResponseModel.fromJson(Map<String, dynamic> json) =>
      ExerciseListResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ExerciseData>.from(
                json["data"]!.map((x) => ExerciseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ExerciseData {
  String? exerciseId;
  String? exerciseTitle;
  String? accessType;
  String? icon;
  String? exerciseUserStatus;
  String? jumlahSoal;
  int? jumlahDone;

  ExerciseData({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  factory ExerciseData.fromJson(Map<String, dynamic> json) => ExerciseData(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
      };
}
