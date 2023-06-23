import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/widgets/image_card_home.dart';
import 'package:flutter_application_randonneur/widgets/call_action_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Equipements",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Cherchez des équipements",
                  prefixIcon: const Icon(Icons.search_rounded),
                  prefixIconColor: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 1.0),
              const CallActionHome(),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nos conseils",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tout voir",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          TransparentImageCard(
                            width: 230,
                            height: 250,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1013/300'),
                            tags: const [],
                            footer: _footer(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          TransparentImageCard(
                            width: 230,
                            height: 250,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1011/300'),
                            tags: const [],
                            footer: _footer(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          TransparentImageCard(
                            width: 230,
                            height: 250,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1012/300'),
                            tags: const [],
                            tagSpacing: 20.0,
                            tagRunSpacing: 200.0,
                            footer: _footer(color: Colors.white),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nos meilleures offres",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Tout voir",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          TransparentImageCard(
                            width: 230,
                            height: 230,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1053/300'),
                            tags: const [],
                            footer: Row(
                              children: [
                                const SizedBox(
                                  height: 140,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 12,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Expanded(
                                    child: Text(
                                  'Tente de Toit',
                                  style: TextStyle(color: Colors.white),
                                )),
                                IconButton(
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          TransparentImageCard(
                            width: 230,
                            height: 230,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1051/300'),
                            tags: const [],
                            footer: Row(
                              children: [
                                const SizedBox(
                                  height: 140,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 12,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Expanded(
                                    child: Text(
                                  'Tente familiale',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share))
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          TransparentImageCard(
                            width: 230,
                            height: 230,
                            imageProvider: const NetworkImage(
                                'https://picsum.photos/id/1032/300'),
                            tags: const [],
                            tagSpacing: 20.0,
                            tagRunSpacing: 100.0,
                            footer: Row(
                              children: [
                                const SizedBox(
                                  height: 140,
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 12,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Expanded(
                                    child: Text(
                                  'Tentes 10 places',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share))
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footer({Color? color}) {
    return Row(
      children: [
        const SizedBox(
          height: 180,
        ),
        const CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          'Camper en famille',
          style: TextStyle(color: color),
        )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share))
      ],
    );
  }
}
