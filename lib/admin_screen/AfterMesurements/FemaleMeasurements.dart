// ignore_for_file: prefer_const_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/Bill.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/Payment.dart';
import 'package:silaiproject/model/mesuremodel.dart';

class measurements extends StatefulWidget {
  const measurements({Key? key}) : super(key: key);

  @override
  State<measurements> createState() => _measurementsState();
}

class _measurementsState extends State<measurements> {
  String level = "cm";
  String? dropdownvalue;
  List<String> cloth = [
    'Blouse',
    'Suit',
    'Gaon',
    'Burkha',
    'Poshak',
    'ChaniyaCholi',
    'Paticoat',
    'Kurti',
  ];

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final neckcontroller = new TextEditingController();
  final shoulderwcontroller = new TextEditingController();
  final Armholecontroller = new TextEditingController();
  final elbowcontroller = new TextEditingController();
  final wristcontroller = new TextEditingController();
  final armlengthcontroller = new TextEditingController();
  final chestcontroller = new TextEditingController();
  final waistcontroller = new TextEditingController();
  final hipcontroller = new TextEditingController();
  final fwaistcontroller = new TextEditingController();
  final bwaistcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfa8919),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Measurements",
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
            child: ListView(
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        radioMesure(),
                        // clothes(),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Neck :                     ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: neckcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    neckcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Shoulder width :    ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: shoulderwcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    shoulderwcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "         Armhole Depth :     ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: Armholecontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    Armholecontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Elbow :                    ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: elbowcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    elbowcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Wrist :                     ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: wristcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    wristcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Arm Length :        ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: armlengthcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    armlengthcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Chest :           ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: chestcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    chestcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Waist :                   ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: waistcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    waistcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Hip :                       ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: hipcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    hipcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Front Waist :         ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: fwaistcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    fwaistcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "          Back Waist :         ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                width: 150,
                                height: 20,
                                child: TextFormField(
                                  controller: bwaistcontroller,
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Can't be empty";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    bwaistcontroller.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Save(),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Widget clothes() {
    return Row(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Select Your Stich',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            dropdownWidth: 150,
            items: cloth
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: dropdownvalue,
            onChanged: (value) {
              setState(() {
                dropdownvalue = value as String;
              });
            },
            buttonHeight: 20,
            buttonWidth: 100,
            itemHeight: 20,
          ),
        ),
        Text("data")
      ],
    );

    Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,
              style: const TextStyle(color: Colors.white),
              underline: Container(),
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              dropdownColor: Colors.black,
              // Down Arrow Icon

              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: cloth.map((String cloth) {
                return DropdownMenuItem(
                  value: cloth,
                  child: Text(cloth),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }*/

  Widget radioMesure() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 1,
        ),
        Text(
          "         Mesurement in:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Text("         Inches"),
            Radio(
                value: "Inches",
                groupValue: level,
                onChanged: (value) {
                  setState(() {
                    level = value.toString();
                  });
                }),
            SizedBox(
              width: 10.0,
            ),
            Text("cm"),
            Radio(
                value: "cm",
                groupValue: level,
                onChanged: (value) {
                  setState(() {
                    level = value.toString();
                  });
                }),
          ],
        ),
      ],
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
          addmesure();
        },
        child: Text(
          "Add",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void addmesure() async {
    final isValid = _formkey.currentState!.validate();
    var date = DateTime.now().toString();
    if (isValid) {
      _formkey.currentState!.save();
      try {
        final User? user = _auth.currentUser;
        Mesurements addmeasure = Mesurements();
        addmeasure.Neck = neckcontroller.text;
        addmeasure.Shoulderwidth = shoulderwcontroller.text;
        addmeasure.ArmholeDepth = Armholecontroller.text;
        addmeasure.Elbow = elbowcontroller.text;
        addmeasure.Wrist = wristcontroller.text;
        addmeasure.ArmLength = armlengthcontroller.text;
        addmeasure.Chest = chestcontroller.text;
        addmeasure.Waist = waistcontroller.text;
        addmeasure.Hip = hipcontroller.text;
        addmeasure.Frontwaist = fwaistcontroller.text;
        addmeasure.Backwaist = bwaistcontroller.text;

        await FirebaseFirestore.instance
            .collection('AddMeasurements')
            .doc(user?.uid)
            .set(addmeasure.toMap());
        Fluttertoast.showToast(msg: "Details added to Database :) ");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const payment()),
            (route) => false);
      } catch (error) {
        Fluttertoast.showToast(msg: "Please enter details");
      }
    }
  }
}
