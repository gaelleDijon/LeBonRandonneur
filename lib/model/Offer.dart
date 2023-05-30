import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  String offerId;
  String ownerId;
  String title;
  String? description;
  double price;
  String pictures;
  String position;
  DateTime? timestamp;
  late String state;
  String category;

  Offer(
      {required this.offerId,
      required this.ownerId,
      required this.title,
      required this.description,
      required this.price,
      required this.pictures,
      required this.position,
      required this.timestamp,
      required this.state,
      required this.category});
}
