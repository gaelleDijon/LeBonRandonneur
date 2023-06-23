import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_randonneur/model/app_message.dart';

class MessageController {
  final messages = FirebaseFirestore.instance.collection('MESSAGES');

  Future<void> sendMessage(AppMessage message) async {
    String messageId;
    if (message.renterId.compareTo(message.ownerId) < 0) {
      messageId = '${message.renterId}-${message.ownerId}';
    } else {
      messageId = '${message.ownerId}-${message.renterId}';
    }

    final messagesRef = messages.doc(messageId).collection('MESSAGES');
    return messagesRef
        .add({
          'renterId': message.renterId,
          'ownerId': message.ownerId,
          'content': message.content,
        })
        .then((value) => null)
        .catchError((e) {
          print("Une erreur s'est produite: $e");
        });
  }

  Stream<List<AppMessage>> getMessagesStream(String renterId, String ownerId) {
    String messageId;
    if (renterId.compareTo(ownerId) < 0) {
      messageId = '$renterId-$ownerId';
    } else {
      messageId = '$ownerId-$renterId';
    }

    final messagesRef = messages.doc(messageId).collection('MESSAGES');
    //order by tiestamp desc
    return messagesRef
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((querySnapshot) {
      List<AppMessage> messagesList =
          querySnapshot.docs.map((doc) => AppMessage(doc)).toList();
      return messagesList;
    });
  }
}
