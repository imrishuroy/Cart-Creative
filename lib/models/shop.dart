import 'dart:convert';

import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final String? shopId;
  final String? name;
  final String? logo;
  final String? location;
  const Shop({
    this.shopId,
    required this.name,
    required this.logo,
    this.location,
  });

  Shop copyWith({
    String? shopId,
    String? name,
    String? logo,
    String? location,
  }) {
    return Shop(
      shopId: shopId ?? this.shopId,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'shopId': shopId,
      'name': name,
      'logo': logo,
      'location': location,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      shopId: map['shopId'],
      name: map['name'],
      logo: map['logo'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) => Shop.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [shopId, name, logo, location];
}
