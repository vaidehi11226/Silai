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
              SizedBox(
                height: 40,
              ),
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
                height: 50,
              ),
              DrawerItem(
                name: 'Home',
                icon: Icons.home,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              SizedBox(
                height: 50,
              ),
              DrawerItem(
                name: 'About Us',
                icon: Icons.info,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              SizedBox(
                height: 50,
              ),
              DrawerItem(
                name: 'Contact Support',
                icon: Icons.contact_support_rounded,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              SizedBox(height: 50),
              DrawerItem(
                name: 'Logout',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 3),
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
            context, MaterialPageRoute(builder: (context) => AboutUs()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => contactsupportuser()));
        break;
      case 3:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginUser(),
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
              "Hey! Customer",
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 232, 157, 246)),
            )
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
                  height: 30,
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
