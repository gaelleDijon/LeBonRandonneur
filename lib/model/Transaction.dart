import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  late String rentId;
  late String offerId;
  late String ownerId;
  late String renterId;
  late double price;
  DateTime? timestamp;
  late String status;
  late String token;

  Transaction(DocumentSnapshot snapshot) {
    rentId = snapshot.id; //id document
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    offerId = map['offerId'];
    ownerId = map['ownerId'];
    renterId = map['renterId'];
    price = map['price'];
    timestamp = (map['timestamp'] as Timestamp).toDate();
    token = map['token'];
  }

  Transaction.empty() {
    rentId = "";
    offerId = "";
    ownerId = "";
    renterId = "";
    price = 0.0;
    price = 0.0;
    timestamp = DateTime.now();
    token = "";
  }
}
