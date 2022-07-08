import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silaiproject/screen_user/ProfileDetail.dart';
import 'package:silaiproject/model/usermodel.dart';
import 'package:silaiproject/screen_user/Navigation_drawer.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  //List<Object> _tailorlist = [];
  UserModel usermodel = UserModel();
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Image.asset(
          'images/Silai.png',
          height: 109.0,
          width: 85.0,
          alignment: Alignment.centerRight,
        ),
        /*actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        ],*/
      ),
      drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: ((overscroll) {
            overscroll.disallowIndicator();
            return true;
          }),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  //onChanged: (value) =>uppdateList(value),
                  '        DressMakers List',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("adminProfile")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => detailProfile(
                                                documentSnapshot:
                                                    documentSnapshot)));
                                  },
                                  child: Card(
                                    color: Colors.black,
                                    elevation: 3,
                                    shadowColor: Colors.purpleAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      leading: Image.network(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot['url'])
                                              : ""),
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot["shopname"])
                                              : "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text(
                                          (documentSnapshot != null)
                                              ? ((documentSnapshot["Address"] !=
                                                      null)
                                                  ? documentSnapshot["Address"]
                                                  : "")
                                              : "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*class DataSearch extends SearchDelegate<String?> {
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
  }*/
