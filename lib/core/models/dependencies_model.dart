class DependenciesModel {
  DataModel data;

  DependenciesModel({
    required this.data,
  });

  factory DependenciesModel.fromJson(Map<String, dynamic> json) =>
      DependenciesModel(
        data: DataModel.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataModel {
  List<TagModel> types;
  List<TagModel> tags;
  List<SocialMediaModel> socialMedia;

  DataModel({
    required this.types,
    required this.tags,
    required this.socialMedia,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        types:
            List<TagModel>.from(json["types"].map((x) => TagModel.fromJson(x))),
        tags:
            List<TagModel>.from(json["tags"].map((x) => TagModel.fromJson(x))),
        socialMedia: List<SocialMediaModel>.from(
            json["social_media"].map((x) => SocialMediaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "social_media": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
      };
}

class SocialMediaModel {
  String value;
  String label;

  SocialMediaModel({
    required this.value,
    required this.label,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      SocialMediaModel(
        value: json["value"] ?? 0,
        label: json["label"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
      };
}

class TagModel {
  int value;
  String label;

  TagModel({
    required this.value,
    required this.label,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) => TagModel(
        value: json["value"] ?? 0,
        label: json["label"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
      };
}
