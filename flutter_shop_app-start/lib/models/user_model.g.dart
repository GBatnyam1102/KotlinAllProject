// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      vs: json['vs'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address?.toJson(),
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name?.toJson(),
      'phoneNumber': instance.phoneNumber,
      'vs': instance.vs,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      geoLocation: json['geoLocation'] == null
          ? null
          : Geolocation.fromJson(json['geoLocation'] as Map<String, dynamic>),
      city: json['city'] as String?,
      street: json['street'] as String?,
      zipCode: json['zipCode'] as String?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'geoLocation': instance.geoLocation?.toJson(),
      'city': instance.city,
      'street': instance.street,
      'zipCode': instance.zipCode,
      'number': instance.number,
    };

Geolocation _$GeolocationFromJson(Map<String, dynamic> json) => Geolocation(
      lat: json['lat'] as String?,
      longL: json['longL'] as String?,
    );

Map<String, dynamic> _$GeolocationToJson(Geolocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'longL': instance.longL,
    };
