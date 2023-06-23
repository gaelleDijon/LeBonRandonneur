// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/globals.dart';
import 'package:flutter_application_randonneur/screens/inscription.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/drawer.dart';

class PasswordReinit extends StatefulWidget {
  const PasswordReinit({Key? key}) : super(key: key);
  @override
  State<PasswordReinit> createState() => _PasswordReinitState();
}

class _PasswordReinitState extends State<PasswordReinit> {
  TextEditingController mail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 5),
                child: Text(
                  'Des difficultés de connexion ?',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                child: Text(
                  ' Le Bon Randonneur',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Text(
                  'Connecte toi à ton compte',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
                child: Text(
                  "Entrez votre adresse mail et nous vous enverrons un code de connexion pour que vous puissiez récupérer l’accès à votre compte.",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 32,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  height: 23,
                  child: Icon(
                    Icons.lock,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: mail,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'mail',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Suivant',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Inscription();
                  }));
                },
                child: const Text(
                  'Pas encore de compte ? En créer un',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
