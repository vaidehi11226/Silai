import 'package:flutter/material.dart';

class Favrouites extends StatefulWidget {
  const Favrouites({Key? key}) : super(key: key);

  @override
  State<Favrouites> createState() => _FavrouitesState();
}

class _FavrouitesState extends State<Favrouites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEFF0F3),
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Favrouties",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }
}
