import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/HomePage1.dart';
import 'package:silaiproject/admin_screen/Login_admin.dart';
import 'package:silaiproject/admin_screen/Myaccount.dart';
import 'package:silaiproject/admin_screen/Navigation_item.dart';

class NavigationDrawer1 extends StatelessWidget {
  //final DocumentSnapshot documentSnapshot;
  const NavigationDrawer1({
    Key? key,
    /*required this.documentSnapshot*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              SizedBox(
                height: 40,
              ),
              Divider(
                thickness: 3,
                height: 10,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Home',
                icon: Icons.home,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              SizedBox(height: 30),
              DrawerItem(
                name: 'My Account',
                icon: Icons.account_circle,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              SizedBox(height: 30),
              Divider(
                thickness: 3,
                height: 10,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: 'Upcoming due',
                icon: Icons.notification_add,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              SizedBox(height: 30),
              DrawerItem(
                name: 'Contact Support',
                icon: Icons.contact_support_rounded,
                onPressed: () => onItemPressed(context, index: 3),
              ),
              SizedBox(height: 30),
              DrawerItem(
                name: 'AboutUs',
                icon: Icons.info,
                onPressed: () => onItemPressed(context, index: 4),
              ),
              SizedBox(height: 30),
              DrawerItem(
                name: 'Logout',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage1()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Myaccount()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => upcomingdue()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => contactstatus()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutUs()));
        break;
      case 5:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Loginscreen(),
          ),
          (route) => false,
        );
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey! DressMaker",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 232, 157, 246)),
            ),
            /*Text(
              documentSnapshot["shopname"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),*/
          ],
        ),
      ],
    );
  }

  Widget AboutUs() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfa8919),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "About Us",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'About Silai',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 500.0,
                  height: 400.0,
                  color: Colors.transparent,
                  child: Text(
                      "We are Helping Dressmaker and Customer to connect directly for order purpose.Many number of dressmaker can create their account in our app that will be useful for customers to view dressmakers details and go for order.Time will be saved as there is no need to visit dressmakers place to check if customer can trust him/her with their clothes to be stiched.Also home and shop Service are available.It is profitable for dessmaker as through the app one's shop is not limited to his/her area but it is world wide now.",
                      style: TextStyle(fontSize: 15)),
                ),
              ],
            )),
      ),
    );
  }

  /*Widget myacc() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );


  }*/

  Widget apointlist() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Appointment List",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget upcomingdue() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Upcoming Due",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget orderlist() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "OrderList",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget contactstatus() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfa8919),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "ContactSupport",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: ((overscroll) {
              overscroll.disallowIndicator();
              return true;
            }),
            child: ListView(children: [
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Icon(Icons.mark_email_unread_rounded),
                  Text(
                    "darjivaidehi2003@gmail.com",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(Icons.mark_email_unread_rounded),
                  Text(
                    "afifahkhan4@gmail.com",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(Icons.mark_email_unread_rounded),
                  Text(
                    "shrenihk30@gmail.com",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 20),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
