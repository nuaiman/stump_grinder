import 'dart:convert';

import 'package:flutter/foundation.dart';

class ContactUs {
  final String phoneNumber;
  final String name;
  final String email;
  final String address;
  final String note;
  final List<String> images;
  final DateTime date;
  ContactUs({
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.address,
    required this.note,
    required this.images,
    required this.date,
  });

  ContactUs copyWith({
    String? phoneNumber,
    String? name,
    String? email,
    String? address,
    String? note,
    List<String>? images,
    DateTime? date,
  }) {
    return ContactUs(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      note: note ?? this.note,
      images: images ?? this.images,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'address': address});
    result.addAll({'note': note});
    result.addAll({'images': images});
    result.addAll({'date': date.millisecondsSinceEpoch});

    return result;
  }

  factory ContactUs.fromMap(Map<String, dynamic> map) {
    return ContactUs(
      phoneNumber: map['phoneNumber'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      note: map['note'] ?? '',
      images: List<String>.from(map['images']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUs.fromJson(String source) =>
      ContactUs.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactUs(phoneNumber: $phoneNumber, name: $name, email: $email, address: $address, note: $note, images: $images, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactUs &&
        other.phoneNumber == phoneNumber &&
        other.name == name &&
        other.email == email &&
        other.address == address &&
        other.note == note &&
        listEquals(other.images, images) &&
        other.date == date;
  }

  @override
  int get hashCode {
    return phoneNumber.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        note.hashCode ^
        images.hashCode ^
        date.hashCode;
  }
}
