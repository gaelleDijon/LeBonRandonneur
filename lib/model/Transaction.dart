import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  String rentId;
  String offerId;
  String ownerId;
  late String renterId;
  double price;
  DateTime? timestamp;
  late String status;
  String token;

  Transaction({
    required this.rentId,
    required this.offerId,
    required this.ownerId,
    required this.renterId,
    required this.price,
    required this.timestamp,
    required this.token,
  });
}
