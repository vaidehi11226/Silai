import 'package:flutter/material.dart';

class AppoinList extends StatefulWidget {
  const AppoinList({Key? key}) : super(key: key);

  @override
  State<AppoinList> createState() => _AppoinListState();
}

class _AppoinListState extends State<AppoinList> {
  @override
  Widget build(BuildContext context) {
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
}
