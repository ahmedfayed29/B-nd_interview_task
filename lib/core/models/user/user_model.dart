import 'package:hr_app/core/models/dependencies_model.dart';

class UserModel {
  int status;
  bool success;
  Data data;
  String accessToken;

  UserModel({
    required this.status,
    required this.success,
    required this.data,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
        "access_token": accessToken,
      };
}

class Data {
  int id;
  String firstName;
  String lastName;
  String about;
  List<TagModel> tags;
  List<String> favoriteSocialMedia;
  int salary;
  String email;
  DateTime birthDate;
  int gender;
  TagModel type;
  String avatar;

  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        about: json["about"],
        tags:
            List<TagModel>.from(json["tags"].map((x) => TagModel.fromJson(x))),
        favoriteSocialMedia:
            List<String>.from(json["favorite_social_media"].map((x) => x)),
        salary: json["salary"],
        email: json["email"],
        birthDate: DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        type: TagModel.fromJson(json["type"]),
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "about": about,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "favorite_social_media":
            List<dynamic>.from(favoriteSocialMedia.map((x) => x)),
        "salary": salary,
        "email": email,
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "type": type.toJson(),
        "avatar": avatar,
      };
}
