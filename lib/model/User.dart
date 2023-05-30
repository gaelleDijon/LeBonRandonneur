import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_randonneur/globals.dart';

class User {
  //attribute
  late String id;
  late String name;
  late String firstname;
  late String email;
  String? avatar;
  late String position;
  double? mark;
  late String phone;
  late String password;

  String get fullName {
    return '$firstname $name';
  }

  User(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    firstname = map['firstname'];
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    position = map['position'];
    avatar = map['avatar'] ?? defaultAvatar;
    mark = map['mark'];
  }

  User.empty() {
    id = "";
    firstname = "";
    name = "";
    email = "";
    position = "";
    phone = "";
  }
}
