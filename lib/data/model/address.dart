class Address {
  final int? addressId; // ID of the address entry
  final int userId; // ID of the associated user
  final String city; // City of the address
  final String district; // District of the address
  final String ward; // Ward of the address
  final String street; // Street of the address

  Address({
    this.addressId,
    required this.userId,
    required this.city,
    required this.district,
    required this.ward,
    required this.street,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        addressId: json['addressId'],
        userId: json['userId'],
        street: json['street'],
        city: json['city'],
        district: json['district'],
        ward: json['ward'],
      );

  Map<String, dynamic> toMap() => {
        'addressId': addressId,
        'userId': userId,
        'street': street,
        'city': city,
        'district': district,
        'ward': ward,
      };
}
