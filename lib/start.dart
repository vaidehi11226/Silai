import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/Login_admin.dart';
import 'package:silaiproject/screen_user/Loginscreen.dart';
import 'package:silaiproject/admin_screen/Register_admin.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 300,
                child: Image.asset(
                  "images/startimage.png",
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text(
                'Admin Login',
                style: TextStyle(fontSize: 30),
              ),
              padding: EdgeInsets.all(20),
              color: Color(0xFFfa8919),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              child: Text(
                'User Login',
                style: TextStyle(fontSize: 30),
              ),
              padding: EdgeInsets.all(20),
              color: Color(0xFFfa8919),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginUser()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
