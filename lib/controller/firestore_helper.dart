import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/controller/user_controller.dart';
import 'package:flutter_application_randonneur/model/offer.dart';
import 'package:flutter_application_randonneur/controller/offer_controller.dart';

import 'package:flutter_application_randonneur/screens/password_reinit.dart';

class FirestoreHelper {
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final firebaseCustomers = FirebaseFirestore.instance.collection("USERS");
  final firebaseMessages = FirebaseFirestore.instance.collection("MESSAGES");
  final firebaseOffers = FirebaseFirestore.instance.collection("OFFERS");

  Future<AppUser> registerUser(String email, String password, String name,
      String firstname, String phone) async {
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    User? user = credential.user;

    if (user == null) {
      print("Erreur null user");
      return Future.error("Erreur à la création du compte");
    } else {
      String uid = user.uid;
      Map<String, dynamic> map = {
        "name": name,
        "firstname": firstname,
        "email": email,
        "phone": phone,
      };

      UserController().addUser(uid, map);
      return UserController().getUser(uid);
    }
  }

  // Future<Offer> registerOffer(
  //     String ownerId,
  //     String title,
  //     String description,
  //     String price,
  //     String pictures,
  //     String state,
  //     String category,
  //     List<String> tags) async {

  //     Map<String, dynamic> map = {
  //       "ownerId": ownerId,
  //       "title": title,
  //       "description": description,
  //       "price": price,
  //       "position": position,
  //       "state": state,
  //       "category": category,
  //       "tags": tags,
  //     // };

  //     OfferController().addOffer(OfferId, map);
  //     return UserController().getUser(uid);
  //   }
  // }

  //TODO
  // Future<AppUser> verifyPhone(String phone, String email) async {
  //   UserCredential credential = await auth.verifyPhoneNumber(
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   User? user = credential.user;
  //   if (user == null) {
  //     return Future.error("Erreur lors de la vérification");
  //   } else {
  //     String uid = user.uid;
  //     return UserController().getUser(uid);
  //   }
  // }

  Future<AppUser> connect(String email, String password) async {
    UserCredential credential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = credential.user;
    if (user == null) {
      return Future.error("Erreur lors de la connexion");
    } else {
      String uid = user.uid;
      return UserController().getUser(uid);
    }
  }

  // Future<AuthStatus> resetPassword({required String email}) async {
  //   await _auth
  //       .sendPasswordResetEmail(email: email)
  //       .then((value) => _status = AuthStatus.successful)
  //       // .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
  //   return _status;
  // }
  Future<bool> resetPassword({required String email}) async {
    await auth
        .sendPasswordResetEmail(email: email)
        .then((value) => print("password reset email sent"));
    // .then((value) => _status = AuthStatus.successful)
    // .catchError(
    //     (e) => _status = AuthExceptionHandler.handleAuthException(e));
    return true;
  }

  Future disconect() async {
    try {
      await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future<String> uploadImage(
      {required String folder,
      required String personnalFolder,
      required String imageName,
      required Uint8List bytesImage}) async {
    String url = "";
    TaskSnapshot taskSnapshot = await storage
        .ref("$folder/$personnalFolder/$imageName")
        .putData(bytesImage);
    url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  // Future<String> sendVerificationCode(String phoneNum) async {
  //   final PhoneAuth phoneAuth = PhoneAuth.instance;
  //   await phoneAuth.verifyPhoneNumber(
  //     phoneNumber: phoneNum,
  //     timeout: const Duration(seconds: 5),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential);
  //       print('Phone authentication successful!');
  //     },
  //     verificationFailed: (PhoneAuthFailure error) {
  //       print('Phone authentication failed. Error: ${error.message}');
  //     },
  //     codeSent: (String verificationId, [int? forceResendingToken]) {
  //       // Store the verification ID to be used later
  //       print('Verification code sent to $phoneNumber');
  //       // Prompt the user to enter the verification code
  //       // using another function or UI element
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Auto-retrieval of the verification code timed out
  //       print('Code auto-retrieval timed out');
  //     },
  //   );
  // }

  //test firebase connection
  Future<void> checkFirebaseConnection() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('example_collection')
          .doc('example_document')
          .get();

      if (snapshot.exists) {
        print('Successfully connected to Firebase and retrieved document.');
      } else {
        print('Connected to Firebase, but document does not exist.');
      }
    } catch (e) {
      print('Error connecting to Firebase: $e');
    }
  }
}
