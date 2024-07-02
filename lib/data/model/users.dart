class Users {
  final int? usrId;
  final String usrName;
  final String usrPassword;
  String? fullname;
  String? phoneNumber;
  String? address;
  String? gmail;
  DateTime? usrBirday;
  bool? isDefault;
  String? usrImage;

  Users(
      {this.usrId,
      required this.usrName,
      required this.usrPassword,
      this.fullname,
      this.phoneNumber,
      this.address,
      this.gmail,
      this.usrBirday,
      this.isDefault,
      this.usrImage});

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        usrName: json["usrName"],
        usrPassword: json["usrPassword"],
        fullname: json["fullname"],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        gmail: json['gmail'],
        usrBirday: json['usrBirday'] != null
            ? DateTime.parse(json['usrBirday'])
            : null,
        isDefault: json['isDefault'] == 1,
        usrImage: json['usrImage'],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrPassword": usrPassword,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "address": address,
        "gmail": gmail,
        "usrBirday": usrBirday?.toIso8601String(),
        "isDefault": isDefault == true ? 1 : 0,
        "usrImage": usrImage
      };
}
