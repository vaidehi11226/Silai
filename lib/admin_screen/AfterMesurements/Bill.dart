import 'package:flutter/material.dart';
import 'dart:math';

import 'package:silaiproject/admin_screen/HomePage1.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  var temp = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfa8919),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Bill",
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
                  height: 200,
                  child: Image.asset(
                    "images/price.png",
                    fit: BoxFit.contain,
                  )),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "         Bill ID :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150,
                      height: 20,
                      child: Text(
                        '$temp',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 400,
                      height: 20,
                      color: Colors.black,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              temp = Random().nextInt(10000);
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                          child: Text(
                            "Random",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "             User Name :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "           User Contact :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "        Stich with Price :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 400,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "            Total Stich :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "             Total Price :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 100,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      "             Advanced Paid :       ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 150,
                      height: 20,
                      child: TextField(
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Save(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget Save() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFfa8919),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage1()));
        },
        child: Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
