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
      backgroundColor: Color(0xEFF0F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
