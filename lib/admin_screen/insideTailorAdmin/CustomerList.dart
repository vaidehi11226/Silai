import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/insideTailorAdmin/detailCustomer.dart';
import 'package:silaiproject/model/billmodel.dart';
import 'package:silaiproject/model/usermodel.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  BillModel billModel = BillModel();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: ((overscroll) {
            overscroll.disallowIndicator();
            return true;
          }),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  '                    Customers List',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("Bill").snapshots(),
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
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                detailCustomer(
                                                    documentSnapshot:
                                                        documentSnapshot)));
                                  },
                                  child: Card(
                                    color: Colors.black,
                                    elevation: 2,
                                    shadowColor: Colors.purpleAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      /*Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  (documentSnapshot != null)
                                                      ? (documentSnapshot['url'])
                                                      : CircularProgressIndicator(
                                                          color: Colors.black,
                                                        )),
                                              fit: BoxFit.cover),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(
                                                0.0,
                                                0.0,
                                              ),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 0.0,
                                              spreadRadius: 0.0,
                                            ),
                                          ]),
                                    ),*/

                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6),
                                        child: Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot["username"])
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
                                              ? ((documentSnapshot["billno"] !=
                                                      null)
                                                  ? documentSnapshot["billno"]
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
                            /*return Dismissible(
                              key: Key(index.toString()),
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                    title: Text((documentSnapshot != null)
                                        ? (documentSnapshot["shopname"])
                                        : ""),
                                    subtitle: Text((documentSnapshot != null)
                                        ? ((documentSnapshot["Address"] != null)
                                            ? documentSnapshot["Address"]
                                            : "")
                                        : ""),
                                    trailing: Image.network(
                                        (documentSnapshot != null)
                                            ? (documentSnapshot['url'])
                                            : ""),
                                    onTap: () {}),
                              ));*/
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
