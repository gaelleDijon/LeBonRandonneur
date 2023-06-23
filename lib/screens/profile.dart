import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/globals.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/screens/connexion.dart';
import 'package:flutter_application_randonneur/screens/history.dart';

class Profile extends StatefulWidget {
  final AppUser newUser;
  Profile({Key? key, required this.newUser}) : super(key: key);
  //  List<int> selection = [0, 1, 2, 3, 4, 5];

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isProfileMod = false;
  String description = "description";
  String title = "title";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:
              // SingleChildScrollView(
              Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                            child: CircleAvatar(
                              radius: 30,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal,
                              child: ClipOval(
                                child: Text(
                                  newUser.firstLetter,
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        newUser.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                    // padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView(
                    children: [
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(isProfileMod
                            ? 'Changer la photo de profil'
                            : 'Modifier le profil'),
                        onTap: () => {
                          setState(() {
                            if (isProfileMod) {
                              //"Valider les modifications" est sélectionné
                            } else {
                              //"Modifier le profil" est sélectionné
                            }
                            isProfileMod = !isProfileMod;
                          }),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(
                            isProfileMod ? 'Modifier ma bio' : 'Paramètres'),
                        onTap: () => {
                          setState(() {
                            if (isProfileMod) {
                              // "Valider les modifications" est sélectionné
                            } else {
                              // "Modifier le profil" est sélectionné
                            }
                            isProfileMod = !isProfileMod;
                          }),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(
                            isProfileMod ? "Nom d'utilisateur" : 'Transaction'),
                        onTap: () => {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Connexion();
                          // })),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(
                            isProfileMod ? "Liens" : 'Connexion et sécurité'),
                        onTap: () => {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Connexion();
                          // })),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: const Text('Aide'),
                        onTap: () => {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return Connexion();
                          // })),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(isProfileMod
                            ? "Changer de mot de passe"
                            : 'Historique'),
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const History();
                          })),
                        },
                      ),
                      ListTile(
                        textColor: Colors.grey[600],
                        selectedColor: Colors.teal,
                        title: Text(isProfileMod
                            ? "Supprimer mon compte"
                            : 'Se déconnecter'),
                        onTap: () => {
                          title = isProfileMod
                              ? "Supprimer mon compte"
                              : "Me déconnecter",
                          description = isProfileMod
                              ? "Etes Vous sûr.e de vouloir supprimer votre cmopte?"
                              : "Êtes vous sûr.e de vouloir vous déconnecter ?",
                          popUp(title, description),
                        },
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  popUp(String title, String desc) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            return CupertinoAlertDialog(
              title: Text(title),
              content: Text(desc),
              actions: [
                const CloseButton(),
                TextButton(
                    onPressed: () {
                      FirestoreHelper().disconect().then((value) {
                        setState(() {
                          newUser = AppUser.empty();
                        });
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Connexion();
                        }),
                      );
                    },
                    child: Text(title)),
              ],
            );
          } else {
            return AlertDialog(
              title: Text(title),
              content: Text(desc),
              actions: [
                const CloseButton(),
                TextButton(
                    onPressed: () {
                      FirestoreHelper().disconect().then((value) {
                        setState(() {
                          newUser = AppUser.empty();
                        });
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Connexion();
                        }),
                      );
                    },
                    child: Text(title))
              ],
            );
          }
        });
  }
}
