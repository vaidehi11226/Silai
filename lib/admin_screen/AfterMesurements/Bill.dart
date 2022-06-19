import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:silaiproject/admin_screen/HomePage1.dart';
import 'package:silaiproject/model/billmodel.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  var temp = 0;
  bool _autovalidate = false;
  final _formkey = GlobalKey<FormState>();

  final billnocontroller = new TextEditingController();
  final usernamecontroller = new TextEditingController();
  final usercontactcontroller = new TextEditingController();
  final Stichwpricecontroller = new TextEditingController();
  final TotalStichcontroller = new TextEditingController();
  final TotalPriceController = new TextEditingController();
  final AdvancedPaid = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  var obscureText = true;

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
            child: Form(
              key: _formkey,
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
                        "         Bill No :       ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 200,
                        height: 20,
                        child: TextFormField(
                          controller: billnocontroller,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter bill no";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            billnocontroller.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          //'$temp',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    /*Flexible(
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black)),
                            child: Text(
                              "Random",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),*/
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "   User Name :        ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: usernamecontroller,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Name";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            usernamecontroller.text = value!;
                          },
                          textInputAction: TextInputAction.next,
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
                        "   User Contact :       ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: usercontactcontroller,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Contact can't be empty";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            usercontactcontroller.text = value!;
                          },
                          textInputAction: TextInputAction.next,
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
                        "   Stich with Price :    ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: Stichwpricecontroller,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Stich&Price ";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            Stichwpricecontroller.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
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
                        "   Total Stich :           ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: TotalStichcontroller,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter TotalStich";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            TotalStichcontroller.text = value!;
                          },
                          textInputAction: TextInputAction.next,
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
                        "   Total Price :           ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: TotalPriceController,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter TotalPrice ";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            TotalPriceController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
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
                        "   Advanced Paid :        ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 470,
                        height: 20,
                        child: TextFormField(
                          controller: AdvancedPaid,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter AdvancePayment";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            AdvancedPaid.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Save(),
              ]),
            ),
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
          getdata();
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

  void getdata() async {
    final isValid = _formkey.currentState!.validate();
    var date = DateTime.now().toString();
    if (isValid) {
      _formkey.currentState!.save();
      try {
        final User? user = _auth.currentUser;
        BillModel billadd = new BillModel();
        // billadd.BillNo = temp as String?;
        billadd.BillNo = billnocontroller.text;
        billadd.username = usernamecontroller.text;
        billadd.usercontact = usercontactcontroller.text;
        billadd.Stichwithprice = Stichwpricecontroller.text;
        billadd.TotalStich = TotalStichcontroller.text;
        billadd.TotalPrice = TotalPriceController.text;
        billadd.AdvancedPaid = AdvancedPaid.text;

        await FirebaseFirestore.instance
            .collection('Bill')
            .doc(user?.uid)
            .set(billadd.toMap());
        Fluttertoast.showToast(msg: "Details added to Database :) ");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage1()),
            (route) => false);
      } catch (error) {
        Fluttertoast.showToast(msg: "Please enter details");
      }
    }
  }
}
