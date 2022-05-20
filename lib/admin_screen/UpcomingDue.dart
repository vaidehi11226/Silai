import 'package:flutter/material.dart';

class UpcomingDue extends StatefulWidget {
  const UpcomingDue({Key? key}) : super(key: key);

  @override
  State<UpcomingDue> createState() => _UpcomingDueState();
}

class _UpcomingDueState extends State<UpcomingDue> {
  @override
  Widget build(BuildContext context) {
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
}
