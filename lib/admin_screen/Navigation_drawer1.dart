import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/HomePage1.dart';
import 'package:silaiproject/admin_screen/Login_admin.dart';
import 'package:silaiproject/admin_screen/Myaccount.dart';
import 'package:silaiproject/admin_screen/Navigation_item.dart';

class NavigationDrawer1 extends StatelessWidget {
  const NavigationDrawer1({Key? key}) : super(key: key);

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
                height: 30,
              ),
              Divider(
                thickness: 1,
                height: 10,
                color: Colors.blueGrey,
              ),
              DrawerItem(
                name: 'Home',
                icon: Icons.home,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'My Account',
                icon: Icons.account_circle,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'Appointment list',
                icon: Icons.calendar_month_rounded,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'Orders list',
                icon: Icons.shopping_cart_checkout,
                onPressed: () => onItemPressed(context, index: 3),
              ),
              SizedBox(height: 30),
              Divider(
                thickness: 1,
                height: 10,
                color: Colors.blueGrey,
              ),
              DrawerItem(
                name: 'Upcoming due',
                icon: Icons.notification_add,
                onPressed: () => onItemPressed(context, index: 4),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'Contact Support',
                icon: Icons.contact_support_rounded,
                onPressed: () => onItemPressed(context, index: 5),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'Logout',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 6),
              ),
              SizedBox(height: 20),
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
            context, MaterialPageRoute(builder: (context) => apointlist()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => orderlist()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => upcomingdue()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => contactstatus()));
        break;
      case 6:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginscreen()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vaidehi",
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
      ],
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
