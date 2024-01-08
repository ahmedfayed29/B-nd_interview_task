class CountryModel {
  int status;
  bool success;
  List<CountryDataModel> data;
  Pagination pagination;

  CountryModel({
    required this.status,
    required this.success,
    required this.data,
    required this.pagination,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        status: json["status"],
        success: json["success"],
        data: List<CountryDataModel>.from(
            json["data"].map((x) => CountryDataModel.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class CountryDataModel {
  int id;
  String countryCode;
  String name;
  String capital;

  CountryDataModel({
    required this.id,
    required this.countryCode,
    required this.name,
    required this.capital,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) =>
      CountryDataModel(
        id: json["id"],
        countryCode: json["country_code"],
        name: json["name"],
        capital: json["capital"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country_code": countryCode,
        "name": name,
        "capital": capital,
      };
}

class Pagination {
  int count;
  int total;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination({
    required this.count,
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json["count"],
        total: json["total"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "perPage": perPage,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}
