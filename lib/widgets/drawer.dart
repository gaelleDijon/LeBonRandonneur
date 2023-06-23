import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
// import 'package:flutter_application_randonneur/model/user.dart';
import 'package:flutter_application_randonneur/screens/connexion.dart';
import 'package:flutter_application_randonneur/screens/profile.dart';

class SideDrawer extends StatelessWidget {
  // const SideDrawer({super.key, required this.newUser});
  final AppUser newUser;
  const SideDrawer({Key? key, required this.newUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: <Widget>[
              const CircleAvatar(
                radius: 32,
                backgroundColor: Colors.teal,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: CircleAvatar(
                  radius: 30,
                  foregroundColor: Colors.teal,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Text(
                      "${newUser.firstLetter}",
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            newUser.firstname,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Partager'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Connexion();
              })),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile(
                  newUser: newUser,
                );
              })),
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_align_justify),
            title: const Text('Politique de contenu'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Connexion();
              })),
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text('Politique de confidentialité'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Connexion();
              })),
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Se déconnecter'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Connexion();
              })),
            },
          ),
        ],
      ),
    );
  }
}
