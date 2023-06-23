import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';

class Message extends StatefulWidget {
  const Message({super.key, required this.newUser});
  final AppUser newUser;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Vous n\'avez pas encore de conversations',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      )),
    );
  }
}
