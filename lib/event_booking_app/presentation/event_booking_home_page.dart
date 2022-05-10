import 'package:flutter/material.dart';
import 'package:portfolio_app/event_booking_app/data/models/category.dart';
import 'package:portfolio_app/event_booking_app/data/models/event.dart';
import 'package:portfolio_app/event_booking_app/presentation/event_booking_detail_page.dart';

class EventBookingHomePage extends StatefulWidget {
  const EventBookingHomePage({Key? key}) : super(key: key);

  @override
  State<EventBookingHomePage> createState() => _EventBookingHomePageState();
}

class _EventBookingHomePageState extends State<EventBookingHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      // borderSide: BorderSide(
      // color: Colors.white.withOpacity(0.1),
      //     ),
    );
    final _mediaQuery = MediaQuery.of(context);
    final _width = _mediaQuery.size.width;
    final _height = _mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "November 20, 9:31PM",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Explore Events",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/11682017/pexels-photo-11682017.jpeg?cs=srgb&dl=pexels-james-11682017.jpg&fm=jpg"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    suffix: InkWell(
                      child: Container(
                        // padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromARGB(1, 87, 201, 243),
                              Color.fromARGB(1, 223, 35, 106),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.account_tree_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    border: outlineInputBorder,
                  ),
                ),
                const SizedBox(height: 40),
                const Text("POPULAR", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  height: _height * 0.2,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: events.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return GestureDetector(
                        onTap: () {
                          debugPrint('go to detail screen: ${event.title}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EventBookingDetailPage(event: event),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      height: _height * 0.2,
                                      width: _width * 0.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(event.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.black,
                                      ),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.55),
                                      )),
                                  Positioned(
                                    top: 13,
                                    right: 13,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: const [
                                          Text(
                                            'Nov',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            '23',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: 50,
                                    child: Text(
                                      getEventTypeString(event.type)
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromRGBO(119, 141, 188, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    bottom: 20,
                                    child: Text(
                                      event.title,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Text("For you".toUpperCase(),
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  height: _height * 0.15,
                  padding: const EdgeInsets.all(20),
                  width: _width * 0.9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      // stops: [0.1, 0.9],
                      colors: [
                        Colors.blue.withOpacity(0.8),
                        Colors.pink.withOpacity(.9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Container(
                            height: 80,
                            width: 60,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "Hello",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Claim 3 free tickets!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Open a premium account and get 3 tickets instantly",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 40),
                Text("Categories".toUpperCase(),
                    style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 10),
                Container(
                  height: _height * 0.1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        // height: 100,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(19, 19, 19, 1),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Container(
                                height: 30,
                                width: 40,
                                child: Image.network(
                                  category.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.title,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${category.numberOfEvents} events',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12),
                                ),
                              ],
                            )
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.explore),
            activeIcon: SizedBox(),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
            activeIcon: SizedBox(),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            activeIcon: SizedBox(),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            activeIcon: SizedBox(),
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
