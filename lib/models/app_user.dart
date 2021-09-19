import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? userId;
  final String? name;
  final String? imageUrl;
  final String? address;
  final String? mobileNo;

  const AppUser({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.mobileNo,
  });

  AppUser copyWith({
    String? userId,
    String? name,
    String? imageUrl,
    String? address,
    String? mobileNo,
  }) {
    return AppUser(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      mobileNo: mobileNo ?? this.mobileNo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
      'mobileNo': mobileNo,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      userId: map['userId'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      address: map['address'],
      mobileNo: map['mobileNo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      userId,
      name,
      imageUrl,
      address,
      mobileNo,
    ];
  }
}
