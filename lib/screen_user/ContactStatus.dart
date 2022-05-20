import 'package:flutter/material.dart';

class ContactStatus extends StatefulWidget {
  const ContactStatus({Key? key}) : super(key: key);

  @override
  State<ContactStatus> createState() => _ContactStatusState();
}

class _ContactStatusState extends State<ContactStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
