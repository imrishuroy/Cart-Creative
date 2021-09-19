import 'dart:convert';

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String logo;

  const Category({
    required this.name,
    required this.logo,
  });

  Category copyWith({
    String? name,
    String? logo,
  }) {
    return Category(
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      logo: map['logo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, logo];
}
