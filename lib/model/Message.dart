import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String messageId;
  String ownerId;
  String renterId;
  String content;
  DateTime timestamp;
  String offerId;

  Message({
    required this.messageId,
    required this.ownerId,
    required this.renterId,
    required this.content,
    required this.timestamp,
    required this.offerId,
  });
}
