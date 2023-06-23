import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/model/offer.dart';

class OfferController {
  final offersCollection = FirebaseFirestore.instance.collection('OFFERS');

  //get offer By id offer
  Future<Offer> getOffer(String id) async {
    DocumentSnapshot snapshot =
        await FirestoreHelper().firebaseOffers.doc(id).get();
    return Offer(snapshot);
  }

  //get all offers
  Future<List> getAllOffers() async {
    QuerySnapshot offers = await offersCollection.get();
    List offersList = [];
    for (int i = 0; i < offers.docs.length; i++) {
      Map? offer = offers.docs[i].data() as Map?;
      offersList.add(
        {
          'offerId': offer!['offerId'],
        },
      );
    }

    return offersList;
  }

  //get all offers posted by a owner
  Future<List> getAllOffersByUID(String ownerId) async {
    QuerySnapshot offers =
        await offersCollection.where('ownerId', isEqualTo: ownerId).get();
    List userOffersList = [];
    for (int i = 0; i < offers.docs.length; i++) {
      Map? userOffers = offers.docs[i].data() as Map?;
      userOffersList.add(
        {
          'offerId': userOffers!['offerId'],
        },
      );
    }
    return userOffersList;
  }

  addOffer(
      String ownerId,
      String title,
      String description,
      double price,
      String pictures,
      String position,
      String state,
      String category,
      DateTime dateFrom,
      DateTime dateTo) {
    int size = 0;
    getAllOffersByUID(ownerId).then((value) => {
          size = (value.length + 1),
          print("$size"),
        });

    Map<String, dynamic> map = {
      "ownerId": ownerId,
      "title": title,
      "description": description,
      "price": price,
      "pictures": pictures,
      "position": position,
      "state": state,
      "category": category,
      "dateFrom": dateFrom,
      "dateTo": dateTo,
    };

    FirestoreHelper().firebaseOffers.doc().set(map);
  }

  updateOffer(String id, Map<String, dynamic> data) {
    FirestoreHelper().firebaseOffers.doc(id).update(data);
  }
}
