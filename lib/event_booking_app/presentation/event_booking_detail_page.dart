import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/models/event.dart';

class EventBookingDetailPage extends StatefulWidget {
  const EventBookingDetailPage({Key? key, required this.event})
      : super(key: key);
  final Event event;

  @override
  State<EventBookingDetailPage> createState() => _EventBookingDetailPageState();
}

class _EventBookingDetailPageState extends State<EventBookingDetailPage> {
  int seletedSection = 0;
  List<String> detailSections = [
    'About',
    'Participants',
    'Location',
    'Contact',
    'FAQ',
    'Terms & Conditions'
  ];

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _width = _mediaQuery.size.width;
    final _height = _mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.event.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.0)
                        ])),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: _width,
              child: Text(
                widget.event.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: _width,
              child: Text("November 20, 9:31 PM",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Container(
              height: _height * 0.08,
              // color: Colors.red,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: detailSections.length,
                  itemBuilder: (context, index) {
                    final title = detailSections[index];
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: seletedSection == index
                              ? Colors.white
                              : const Color.fromRGBO(19, 19, 19, 1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: seletedSection == index
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            const Text(
              "This week, Abel comes back to California to perform his newest studio album, as well as some newest hits. Check him out!",
              style: TextStyle(color: Colors.white, fontSize: 18),
              softWrap: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
              ),
              onPressed: () {},
              child: Container(
                // width: _width * 0.9,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    // stops: [0.1, 0.9],
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.pink.withOpacity(.9),
                    ],
                  ),
                ),
                child: const Text(
                  "Buy Tickets for \$79",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
              ),
              onPressed: () {},
              child: Container(
                // width: _width * 0.9,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(19, 19, 19, 1),
                ),
                child: const Text(
                  "Save for later",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
