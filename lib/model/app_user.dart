import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_randonneur/globals.dart';

class AppUser {
  //attributes
  late String id;
  late String name;
  late String firstname;
  late String email;
  String? avatar;
  String? position;
  double? mark;
  late String phone;

  String get fullName {
    return '$firstname $name';
  }

  String get firstLetter {
    String input = firstname;
    if (input.isEmpty) {
      return '';
    } else {
      return input[0];
    }
  }

  AppUser(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    firstname = map['firstname'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    position = map['position'] ?? "non renseignée";
    avatar = map['avatar'] ?? defaultAvatar;
    mark = map['mark'] ?? 0.0;
  }

  AppUser.empty() {
    id = "";
    firstname = "";
    name = "";
    email = "";
    phone = "";
  }
}
