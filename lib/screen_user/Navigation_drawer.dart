import 'package:flutter/material.dart';
import 'package:silaiproject/screen_user/Appoitment.dart';
import 'package:silaiproject/screen_user/HomePage1.dart';
import 'package:silaiproject/screen_user/Loginscreen.dart';
import 'package:silaiproject/screen_user/Navigation_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
              DrawerItem(
                name: 'Contact Support',
                icon: Icons.contact_support_rounded,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              SizedBox(height: 20),
              DrawerItem(
                name: 'Logout',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 2),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => contactsupportuser()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginUser()));
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
              style: TextStyle(fontSize: 14, color: Colors.black),
            )
          ],
        ),
      ],
    );
  }

  Widget contactsupportuser() {
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

  Widget orderstatususer() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "OrderStatus",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
