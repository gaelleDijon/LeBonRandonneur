import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_application_randonneur/controller/firestore_helper.dart';
import 'package:flutter_application_randonneur/controller/offer_controller.dart';
import 'package:flutter_application_randonneur/model/app_user.dart';
import 'package:flutter_application_randonneur/screens/annonces/store.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_application_randonneur/widgets/bottom_navbar.dart';

import '../../globals.dart';
import '../../widgets/drawer.dart';

class NewAnnonce extends StatefulWidget {
  const NewAnnonce({super.key, required this.newUser});
  final AppUser newUser;

  @override
  State<NewAnnonce> createState() => _NewAnnonceState();
}

class _NewAnnonceState extends State<NewAnnonce> {
  TextEditingController image = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController description = TextEditingController();
  // TextEditingController state = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController dateFrom = TextEditingController();
  TextEditingController dateTo = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double priceval = 0.0;
  DateTime dateFromd = DateTime.now();
  DateTime dateTod = DateTime.now();
  String selectedValueState = "Neuf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text("Ajouter une annonce"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 40),
              TextFormField(
                controller: image,
                decoration:
                    const InputDecoration(labelText: "Ajoutez des photos"),
                validator: (value) {},
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: "Nom du produit"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Entrez un nom pour votre produit";
                  } else {
                    return null;
                  }
                },
              ),
              TextField(
                controller: description,
                maxLength: 200,
                decoration: const InputDecoration(labelText: "Description"),
              ),

              DropdownButton(
                value: selectedValueState,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueState = newValue!;
                  });
                },
                items: dropdownItemsState,
              ),

              TextFormField(
                controller: category,
                decoration: InputDecoration(labelText: "Categories"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Entrez une catégorie";
                  } else {
                    return null;
                  }
                },
              ),

              TextFormField(
                controller: price,
                decoration: InputDecoration(labelText: "Tarif"),
                validator: (value) {
                  if (value!.isEmpty || RegExp(r"[^\d.]{1,}").hasMatch(value)) {
                    return "Prix manquant ou n'est pas une valeur reconnue";
                  } else {
                    priceval = double.parse(price.text);
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: position,
                decoration: const InputDecoration(labelText: "Localisation"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Entrez une localisation pour que votre produit apparaisse sur la carte";
                  } else {
                    return null;
                  }
                },
              ),

              TextField(
                controller: dateFrom, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Date de début de location" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime
                          .now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateFrom.text =
                          formattedDate; //set output date to TextField value.
                      dateFromd = pickedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              TextField(
                controller: dateTo,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Date de fin de location"),
                readOnly:
                    true, //set it true, so that user won't be able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime
                          .now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    // print(formattedDate);
                    setState(() {
                      dateTo.text =
                          formattedDate; //set output date to TextField value.
                      dateTod = pickedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Déposer l\'annonce',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    OfferController().addOffer(
                        newUser.id,
                        name.text,
                        description.text,
                        priceval,
                        image.text,
                        position.text,
                        selectedValueState,
                        category.text,
                        dateFromd,
                        dateTod);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Store(newUser: newUser);
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItemsState {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Neuf"), value: "Neuf"),
      const DropdownMenuItem(child: Text("Bon état"), value: "Bon état"),
      const DropdownMenuItem(
          child: Text("Mauvais état"), value: "Mauvais état"),
    ];
    return menuItems;
  }
}
