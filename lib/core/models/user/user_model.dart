class UserModel {
  String fullName;
  String mobile;
  String emergencyMobile;
  String email;
  bool gender;
  bool enableNotify;
  num wallet;
  num rate;
  String mobileDialCode;
  String emergencyMobileDialCode;
  int cityId;
  int countryId;
  String cityName;
  String countryName;
  DateTime birthDate;
  String birthDateStr;
  String idEqamaNumber;
  String idEqamaImage;
  String profileImage;
  String tokenId;

  UserModel({
    required this.fullName,
    required this.mobile,
    required this.emergencyMobile,
    required this.email,
    required this.gender,
    required this.enableNotify,
    required this.wallet,
    required this.rate,
    required this.mobileDialCode,
    required this.emergencyMobileDialCode,
    required this.cityId,
    required this.countryId,
    required this.cityName,
    required this.countryName,
    required this.birthDate,
    required this.birthDateStr,
    required this.idEqamaNumber,
    required this.idEqamaImage,
    required this.profileImage,
    required this.tokenId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        mobile: json["mobile"],
        emergencyMobile: json["emergencyMobile"],
        email: json["email"],
        gender: json["gender"],
        enableNotify: json["enableNotify"],
        wallet: json["wallet"],
        rate: json["rate"],
        mobileDialCode: json["mobileDialCode"],
        emergencyMobileDialCode: json["emergencyMobileDialCode"],
        cityId: json["cityId"],
        countryId: json["countryId"],
        cityName: json["cityName"],
        countryName: json["countryName"],
        birthDate: DateTime.parse(json["birthDate"]),
        birthDateStr: json["birthDateStr"],
        idEqamaNumber: json["idEqamaNumber"],
        idEqamaImage: json["idEqamaImage"] ?? "",
        profileImage: json["profileImage"] ?? "",
        tokenId: json["tokenId"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "mobile": mobile,
        "emergencyMobile": emergencyMobile,
        "email": email,
        "gender": gender,
        "enableNotify": enableNotify,
        "wallet": wallet,
        "rate": rate,
        "mobileDialCode": mobileDialCode,
        "emergencyMobileDialCode": emergencyMobileDialCode,
        "cityId": cityId,
        "countryId": countryId,
        "cityName": cityName,
        "countryName": countryName,
        "birthDate": birthDate.toIso8601String(),
        "birthDateStr": birthDateStr,
        "idEqamaNumber": idEqamaNumber,
        "idEqamaImage": idEqamaImage,
        "profileImage": profileImage,
        "tokenId": tokenId,
      };
}
