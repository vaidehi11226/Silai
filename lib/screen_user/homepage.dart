/*import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:silaiproject/screen/square.dart';
import 'package:geocoder/geocoder.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int index = 0;

  final screen = [
    homepage(),
    //cart(),
    //profile(),
    //menu(),
  ];

  var locationMessage = "";
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);

    var lat = position.latitude;
    var long = position.longitude;
    print("$lat,$long");
    Colors.white;
    getAddressfromCoordinates(
      Coordinates(lat, long),
    );

    setState(() {
      locationMessage = "$position";
    });
  }

  void getAddressfromCoordinates(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 251, 251),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'images/Silai.png',
          height: 109.0,
          width: 85.0,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 70, 3, 83),
                  Color.fromARGB(255, 146, 54, 152),
                ], stops: [
                  0.5,
                  1.0
                ]),
              ),
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 05.0),
                      child: GestureDetector(
                        onTap: () {
                          getCurrentLocation();
                        },
                        child: Text(
                          "Get current location",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 5, color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Position :$locationMessage"),
                ],
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                  Mysquare(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.person),
                label: 'Person'),
            NavigationDestination(
                icon: Icon(Icons.menu_outlined),
                selectedIcon: Icon(Icons.menu),
                label: 'Menu'),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String?> {
  final maharashtra = [
    'Ahmednagar',
    'Akola',
    'Amravati',
    'Aurangabad',
    'Bhandara',
    'Beed',
    'Buldhana',
    'Chandrapur',
    'Dhule',
    'Gadchiroli',
    'Gondia',
    'Hingoli',
    'Jalgaon',
    'Jalna',
    'Kolhapur',
    'Latur',
    'Mumbai City',
    'Mumbai suburban',
    'Nandurbar',
    'Nanded',
    'Nagpur',
    'Nashik',
    'Osmanabad',
    'Parbhani',
    'Pune',
    'Raigad',
    'Ratnagiri',
    'Sindhudurg',
    'Sangli',
    'Solapur',
    'Satara',
    'Thane',
    'Wardha',
    'Washim',
    'Yavatmal',
  ];

  final recentplace = [
    'Pune',
    'Thane',
    'Mumbai City',
    'Mumbai suburban',
    'Kolhapur',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.blueGrey,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone seraches for something
    final suggestionList = query.isEmpty
        ? recentplace
        : maharashtra.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }

  Widget listview() {
    return ListView(
      children: [
        Mysquare(),
        Mysquare(),
        Mysquare(),
        Mysquare(),
        Mysquare(),
        Mysquare(),
        Mysquare(),
        Mysquare(),
      ],
    );
  }
}*/
