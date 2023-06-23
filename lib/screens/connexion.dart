// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/globals.dart';
import 'package:flutter_application_randonneur/screens/inscription.dart';
import 'package:flutter_application_randonneur/screens/password_reinit.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/drawer.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);
  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

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
                  'Bienvenue sur',
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
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: mail,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: password,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Mot de passe',
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
                    'Se connecter',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    FirestoreHelper()
                        .connect(mail.text, password.text)
                        .then((value) {
                      setState(() {
                        newUser = value;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Scaffold(
                            drawer: SideDrawer(
                              newUser: newUser,
                            ),
                            appBar: AppBar(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            body: BottomBarScreen(
                              newUser: newUser,
                            ),
                          );
                        }),
                      );
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PasswordReinit();
                  }));
                },
                child: const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(color: Colors.white),
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
