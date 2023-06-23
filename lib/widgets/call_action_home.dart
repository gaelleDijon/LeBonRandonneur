import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/widgets/image_card_home.dart';

class CallActionHome extends StatelessWidget {
  const CallActionHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                TransparentImageCard(
                  width: 250,
                  height: 150,
                  imageProvider:
                      const NetworkImage('https://picsum.photos/id/1003/300'),
                  tags: const [],
                  title: _title(
                      color: Colors.white,
                      title: "PRETS POUR DES VACANCES SEREINES ?"),
                  description: _content(
                    color: Colors.white,
                    content: "COMMENCER A LOUER",
                  ),
                ),
                const SizedBox(width: 10),
                TransparentImageCard(
                  width: 250,
                  height: 150,
                  imageProvider:
                      const NetworkImage('https://picsum.photos/id/1002/300'),
                  tags: const [],
                  title: _title(
                    color: Colors.white,
                    title: "LA DEMARCHE ECORESPONSABLE",
                  ),
                  description: _content(
                    color: Colors.white,
                    content: "VOIR PLUS",
                  ),
                ),
                const SizedBox(width: 10),
                TransparentImageCard(
                  width: 250,
                  height: 150,
                  imageProvider:
                      const NetworkImage('https://picsum.photos/id/1001/300'),
                  tags: const [],
                  tagSpacing: 20.0,
                  tagRunSpacing: 200.0,
                  title: _title(
                    color: Colors.white,
                    title: "PRET A ECONOMISER ?",
                  ),
                  description: _content(
                      color: Colors.white,
                      content: "VOIR NOS MEILLEURES OFFRES"),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title({Color? color, required String title}) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
    );
  }

  Widget _content({Color? color, required String content}) {
    return Text(
      content,
      style: TextStyle(color: color),
    );
  }

  Widget _footer({Color? color}) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ),
          radius: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          'Super user',
          style: TextStyle(color: color),
        )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share))
      ],
    );
  }
}
