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
