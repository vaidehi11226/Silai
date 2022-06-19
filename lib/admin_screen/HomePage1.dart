import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/Navigation_drawer1.dart';
import 'package:silaiproject/admin_screen/insideTailorAdmin/AddOrder.dart';
import 'package:silaiproject/admin_screen/insideTailorAdmin/CustomerList.dart';
import 'package:silaiproject/admin_screen/insideTailorAdmin/LatestDesign.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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
      drawer: NavigationDrawer1(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  AddOrderButton(),
                  SizedBox(
                    height: 80,
                  ),
                  CustomerListButton(),
                  SizedBox(
                    height: 80,
                  ),
                  //LatestDesignButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget AddOrderButton() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddOrder()),
          );
        },
        child: Text(
          "Add Order",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget CustomerListButton() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerList()));
        },
        child: Text(
          "Customer List",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /* Widget LatestDesignButton() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(25),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Latestdesign()));
        },
        child: Text(
          "Latest Design",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }*/
}
