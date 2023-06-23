import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  late String offerId;
  late String ownerId;
  late String title;
  String? description;
  late double price;
  late String pictures;
  late String position;
  DateTime? timestamp;
  DateTime? dateFrom;
  DateTime? dateTo;
  late String state;
  late String category;
  List<String>? tags;

  Offer(DocumentSnapshot snapshot) {
    offerId = snapshot.id; //id document
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    ownerId = map['ownerId'];
    title = map['title'];
    description = map['description'];
    price = map['price'];
    pictures = map['pictures'];
    position = map['position'];
    state = map['state'];
    category = map['category'];
    dateFrom = (map['dateFrom'] as Timestamp).toDate();
    dateTo = (map['dateTo'] as Timestamp).toDate();
    timestamp = (map['timestamp'] as Timestamp).toDate();
  }

  Offer.empty() {
    offerId = "";
    ownerId = "";
    title = "";
    description = "";
    price = 0.0;
    position = "";
    state = "";
    category = "";
    dateFrom = DateTime.now();
    dateTo = DateTime(2030, 1, 1, 1, 30);
    timestamp = DateTime.now();
  }
}
