import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.separated(
                    itemCount: 3,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 2,
                      height: 24,
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://picsum.photos/id/1012/300'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Batons de marche",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "70,90",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            const Spacer(
                              flex: 7,
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
