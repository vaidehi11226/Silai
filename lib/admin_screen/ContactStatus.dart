import 'package:flutter/material.dart';

class ContactStatus extends StatefulWidget {
  const ContactStatus({Key? key}) : super(key: key);

  @override
  State<ContactStatus> createState() => _ContactStatusState();
}

class _ContactStatusState extends State<ContactStatus> {
  @override
  Widget build(BuildContext context) {
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
