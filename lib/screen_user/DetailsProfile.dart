import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silaiproject/screen_user/HomePage1.dart';

class DetailsProfile extends StatefulWidget {
  const DetailsProfile({Key? key}) : super(key: key);

  @override
  State<DetailsProfile> createState() => _DetailsProfileState();
}

class _DetailsProfileState extends State<DetailsProfile> {
  @override
  Widget build(BuildContext context) {
    HomePage1 documentSnapshot = Provider.of<HomePage1>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile details"),
      ),
    );
  }
}
