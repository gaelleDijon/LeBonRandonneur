import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/controller/offer_controller.dart';
import 'package:flutter_application_randonneur/globals.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/model/offer.dart';
import 'package:flutter_application_randonneur/screens/annonces/new_annonces.dart';
import 'package:flutter_svg/svg.dart';

class Store extends StatefulWidget {
  final AppUser newUser;
  const Store({Key? key, required this.newUser}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  Future<List>? contentList;

  @override
  void initState() {
    super.initState();
    contentList = OfferController().getAllOffersByUID(newUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: contentList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // indicateur de chargement pendant que la future est en cours d'exécution
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Gestion erreurs
          return Text('Une erreur s\'est produite : ${snapshot.error}');
        } else {
          final size = snapshot.data!.length;

          print("$size");

          // if (size < 1) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(
                    'annonce.svg',
                    height: MediaQuery.of(context).size.width / 4,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Tu n'as pas encore posté d'annonce",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Déposer une annonce',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return NewAnnonce(newUser: newUser);
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          // } else {
          //   var listeAnnonces = [];
          //   //getting a list of all offers from 0 to length-1
          //   Future<Offer> offer;
          //   OfferController().getAllOffersByUID(newUser.id).then(
          //         (value) => {
          //           // size = (value.length),
          //           for (var i in value)
          //             {
          //               OfferController().getOffer(i).then((value) => {
          //                     listeAnnonces.add(
          //                       {
          //                         "uid": newUser.id,
          //                         "username": newUser.fullName,
          //                         "title": value.title,
          //                         "price": value.price,
          //                         "image": value.pictures,
          //                       },
          //                     ),
          //                   }),
          //             },
          //         },
          //       );

          //   return
          //       // SingleChildScrollView(
          //       //   child:
          //       Scaffold(
          //     body: Center(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           const SizedBox(
          //             height: 20,
          //           ),
          //           SvgPicture.asset(
          //             'annonce.svg',
          //             height: MediaQuery.of(context).size.width / 4,
          //           ),
          //           // const SizedBox(height: 30),
          //           SingleChildScrollView(
          //             scrollDirection: Axis.horizontal,
          //             child: Row(
          //               children: [
          //                 for (var x in listeAnnonces) ...[
          //                   Container(
          //                     width: 60,
          //                     height: 60,
          //                     child: Column(
          //                         mainAxisSize: MainAxisSize.min,
          //                         children: [
          //                           Text(
          //                             "${x.title}",
          //                             style: TextStyle(fontSize: 4),
          //                           ),
          //                           Text(
          //                             "${x.username}",
          //                             style: TextStyle(fontSize: 4),
          //                           ),
          //                           Text(
          //                             "${x.price}",
          //                             style: TextStyle(fontSize: 4),
          //                           ),
          //                           // Text("${x.pictures}"),
          //                           Text(
          //                             "${x.uid}",
          //                             style: TextStyle(fontSize: 4),
          //                           ),
          //                           Text(
          //                             "AAAAHHHHHHH",
          //                             style: TextStyle(fontSize: 4),
          //                           ),
          //                         ]),
          //                   ),
          //                   const SizedBox(
          //                     width: 10,
          //                   ),
          //                 ],
          //               ],
          //             ),
          //           ),
          //           SizedBox(
          //             height: 40,
          //             width: MediaQuery.of(context).size.width / 2,
          //             child: FloatingActionButton(
          //               backgroundColor: Theme.of(context).primaryColor,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //               ),
          //               child: Text(
          //                 'Déposer une autre annonce',
          //                 style: TextStyle(
          //                   color: Theme.of(context).colorScheme.secondary,
          //                   fontSize: 16,
          //                 ),
          //               ),
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(builder: (context) {
          //                     return NewAnnonce(newUser: newUser);
          //                   }),
          //                 );
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     // ),
          //   );
          //   ;
          // }
          // } else {
          //   final listeAnnonces = snapshot.data!;

          //   return Scaffold(
          //     body: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 10.0,
          //         mainAxisSpacing: 10.0,
          //         childAspectRatio: 0.75,
          //       ),
          //       itemCount: listeAnnonces.length,
          //       itemBuilder: (context, index) {
          //         final annonce = listeAnnonces[index];
          //         for (var annonce in listeAnnonces) {
          //           print(annonce["offerId"]);
          //         }
          //         return Card(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(annonce[
          //                   "h9ZdbIzBt1SIPFsYWKSb"]), // Afficher l'offerId
          //               Text(newUser.fullName),
          //               Text(annonce.title),
          //               Text(annonce.price),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //     floatingActionButton: FloatingActionButton(
          //       backgroundColor: Theme.of(context).primaryColor,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Text(
          //         'Déposer une autre annonce',
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.secondary,
          //           fontSize: 16,
          //         ),
          //       ),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) {
          //             return NewAnnonce(newUser: widget.newUser);
          //           }),
          //         );
          //       },
          //     ),
          //   );
          // }
        }
      },
    );
  }
}
