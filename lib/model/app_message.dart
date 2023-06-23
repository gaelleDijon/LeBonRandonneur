import 'package:cloud_firestore/cloud_firestore.dart';

class AppMessage {
  late String messageId;
  late String ownerId;
  late String renterId;
  late String content;
  late DateTime timestamp;
  late String offerId;

  AppMessage(DocumentSnapshot snapshot) {
    messageId = snapshot.id; //id document combi
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    ownerId = map['ownerId'];
    renterId = map['renterId'];
    content = map['content'];
    timestamp = (map['timestamp'] as Timestamp).toDate();
    // offerId = map['offerId'];
  }

  AppMessage.empty() {
    messageId = "";
    ownerId = "";
    renterId = "";
    content = "";
    timestamp = DateTime.now();
  }
}
