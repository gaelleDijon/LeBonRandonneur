import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/globals.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/screens/annonces/store.dart';
import 'package:flutter_application_randonneur/screens/home.dart';
import 'package:flutter_application_randonneur/screens/history.dart';
import 'package:flutter_application_randonneur/screens/message.dart';
import 'package:flutter_application_randonneur/screens/profile.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key, required this.newUser});
  final AppUser newUser;

  @override
  // _BottomBarScreenState createState() => _BottomBarScreenState();
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Widget>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const Home(),
      },
      {
        'page': const History(),
      },
      {
        'page': Store(newUser: newUser),
      },
      {
        'page': Message(newUser: newUser),
      },
      {
        'page': Profile(newUser: newUser),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 1.1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              //backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Theme.of(context).primaryColor,
              currentIndex: _selectedPageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Chercher',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'Mes annonces',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'profil',
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FloatingActionButton(
      //     hoverElevation: 5,
      //     splashColor: const Color.fromARGB(255, 117, 167, 149),
      //     backgroundColor: const Color.fromARGB(255, 14, 115, 78),
      //     tooltip: 'Add',
      //     elevation: 4,
      //     child: Icon(Icons.add),
      //     onPressed: () => setState(() {
      //       _selectedPageIndex = 1;
      // }),
      //  ),
      // ),
    );
  }
}
