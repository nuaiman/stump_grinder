import 'dart:convert';

import 'package:flutter/foundation.dart';

class ContactUsModel {
  final String phone;
  final String name;
  final String email;
  final String address;
  final String note;
  final List<String> images;
  ContactUsModel({
    required this.phone,
    required this.name,
    required this.email,
    required this.address,
    required this.note,
    required this.images,
  });

  ContactUsModel copyWith({
    String? phone,
    String? name,
    String? email,
    String? address,
    String? note,
    List<String>? images,
  }) {
    return ContactUsModel(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      note: note ?? this.note,
      images: images ?? this.images,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsModel.fromJson(String source) =>
      ContactUsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactUs(phone: $phone, name: $name, email: $email, address: $address, note: $note, images: $images)';
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
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        note.hashCode ^
        images.hashCode;
  }
}
