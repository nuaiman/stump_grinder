import 'dart:convert';

import 'package:flutter/foundation.dart';

class ContactUsModel {
  final String phone;
  final String name;
  final String email;
  final String address;
  final String note;
  final List<String> images;
  final double width;
  final double height;
  final double cost;
  ContactUsModel({
    required this.phone,
    required this.name,
    required this.email,
    required this.address,
    required this.note,
    required this.images,
    required this.width,
    required this.height,
    required this.cost,
  });

  ContactUsModel copyWith({
    String? phone,
    String? name,
    String? email,
    String? address,
    String? note,
    List<String>? images,
    double? width,
    double? height,
    double? cost,
  }) {
    return ContactUsModel(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      note: note ?? this.note,
      images: images ?? this.images,
      width: width ?? this.width,
      height: height ?? this.height,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'phone': phone});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'address': address});
    result.addAll({'note': note});
    result.addAll({'images': images});
    result.addAll({'width': width});
    result.addAll({'height': height});
    result.addAll({'cost': cost});

    return result;
  }

  factory ContactUsModel.fromMap(Map<String, dynamic> map) {
    return ContactUsModel(
      phone: map['phone'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      note: map['note'] ?? '',
      images: List<String>.from(map['images']),
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      cost: map['cost']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsModel.fromJson(String source) =>
      ContactUsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactUsModel(phone: $phone, name: $name, email: $email, address: $address, note: $note, images: $images, width: $width, height: $height, cost: $cost)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactUsModel &&
        other.phone == phone &&
        other.name == name &&
        other.email == email &&
        other.address == address &&
        other.note == note &&
        listEquals(other.images, images) &&
        other.width == width &&
        other.height == height &&
        other.cost == cost;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        note.hashCode ^
        images.hashCode ^
        width.hashCode ^
        height.hashCode ^
        cost.hashCode;
  }
}
