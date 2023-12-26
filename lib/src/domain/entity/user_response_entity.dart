import 'dart:convert';

class UserResponseEntity {
  int status;
  String message;
  UserDataEntity data;

  UserResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class UserDataEntity {
  String iduser;
  String userName;
  String userEmail;
  String userFoto;
  String userAsalSekolah;
  String dateCreate;
  String jenjang;
  String userGender;
  String userStatus;
  String kelas;

  UserDataEntity({
    required this.iduser,
    required this.userName,
    required this.userEmail,
    required this.userFoto,
    required this.userAsalSekolah,
    required this.dateCreate,
    required this.jenjang,
    required this.userGender,
    required this.userStatus,
    required this.kelas,
  });

  factory UserDataEntity.fromMap(Map<String, dynamic> json) => UserDataEntity(
        iduser: json["iduser"] ?? '',
        userName: json["user_name"] ?? '',
        userEmail: json["user_email"] ?? '',
        userFoto: json["user_foto"] ?? '',
        userAsalSekolah: json["user_asal_sekolah"] ?? '',
        dateCreate: json["date_create"] ?? '',
        jenjang: json["jenjang"] ?? '',
        userGender: json["user_gender"] ?? '',
        userStatus: json["user_status"] ?? '',
        kelas: json["kelas"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "user_foto": userFoto,
        "user_asal_sekolah": userAsalSekolah,
        "date_create": dateCreate,
        "jenjang": jenjang,
        "user_gender": userGender,
        "user_status": userStatus,
        "kelas": kelas,
      };

  String toJson() => json.encode(toMap());

  factory UserDataEntity.fromJson(String source) =>
      UserDataEntity.fromMap(json.decode(source));
}
