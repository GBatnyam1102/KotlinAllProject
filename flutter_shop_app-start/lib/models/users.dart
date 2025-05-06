import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final Address? address;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final String? phoneNumber;
  final int? vs;

  UserModel({
    this.id,
    this.address,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phoneNumber,
    this.vs,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     _$UserModelFromJson(json);
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  static List<UserModel> fromList(List<dynamic> data) =>
      data.map((e) => UserModel().fromJson(e)).toList();
}

@JsonSerializable()
class Name {
  final String? fname;
  final String? lname;

  Name({this.fname, this.lname});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Address {
  final Geolocation? geoLocation;
  final String? city;
  final String? street;
  final String? zipCode;
  final int? number;

  Address({
    this.geoLocation,
    this.city,
    this.street,
    this.zipCode,
    this.number,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Geolocation {
  final String? lat;
  final String? longL;

  Geolocation({this.lat, this.longL});

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationToJson(this);
}
