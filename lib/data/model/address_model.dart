class Address {
  int? id;
  String? userName;
  String? phoneNumber;
  String? address;
  bool? isDefault;

  Address({
    this.id,
    this.userName,
    this.phoneNumber,
    this.address,
    this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['isDefault'] = isDefault;
    return data;
  }
}
