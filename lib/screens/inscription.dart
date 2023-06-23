import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/widgets/bottom_navbar.dart';

import '../globals.dart';
import '../widgets/drawer.dart';
import 'connexion.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController name = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordSec = TextEditingController();
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
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: Text(
                  'Bienvenue sur',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 50),
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
                  'Inscrit toi pour te connecter',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: firstname,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Prénom',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: name,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Nom',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                  //     replacementString: 'btch',
                  //   ),
                  // ],
                  controller: email,
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
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: phone,
                  // keyboardType: TextInputType.phone,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.digitsOnly,
                  //   // FilteringTextInputFormatter.allow(r'^(?=.*\d).{10}$'),
                  // ],
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Téléphone',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: password,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(
                  //     RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$'),
                  //   ),
                  // ],
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText:
                        "8 caractères, une majuscule, une minuscule et un chiffre au moins",
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
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
                    'Créer un compte',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    if (email.text.isEmpty ||
                        password.text.isEmpty ||
                        firstname.text.isEmpty ||
                        name.text.isEmpty ||
                        phone.text.isEmpty) {
                      print("Champs manquants");
                      String state = "vous n'avez pas rempli tous les champs";
                      return;
                    }
                    FirestoreHelper()
                        .registerUser(email.text, password.text, name.text,
                            firstname.text, phone.text)
                        .then(
                      (value) {
                        setState(() {
                          newUser = value;
                          String state =
                              "vous n'avez pas rempli tous les champs";
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
                      },
                    ).catchError(
                      (e) {
                        print("Une erreur s'est produite: $e");
                      },
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Connexion();
                  }));
                },
                child: const Text(
                  'Déjà un compte ? Se connecter',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
