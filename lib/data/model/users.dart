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

  Users({
    this.usrId,
    required this.usrName,
    required this.usrPassword,
    this.fullname,
    this.phoneNumber,
    this.address,
    this.gmail,
    this.usrBirday,
    this.isDefault,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        usrName: json["usrName"],
        usrPassword: json["usrPassword"],
        fullname: json["fullname"],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        gmail: json['gmail'],
        usrBirday: json['usrBirday'],
        isDefault: json['isDefault'],
      );

  Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrPassword": usrPassword,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "address": address,
        "gmail": gmail,
        "usrBirday": usrBirday,
        "isDefault": isDefault,
      };
}
