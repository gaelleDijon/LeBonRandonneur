import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';

class UserController {
  Future<AppUser> getUser(String id) async {
    DocumentSnapshot snapshot =
        await FirestoreHelper().firebaseCustomers.doc(id).get();
    return AppUser(snapshot);
  }

  addUser(String id, Map<String, dynamic> data) {
    FirestoreHelper().firebaseCustomers.doc(id).set(data);
  }

  updateUser(String id, Map<String, dynamic> data) {
    FirestoreHelper().firebaseCustomers.doc(id).update(data);
  }
}
