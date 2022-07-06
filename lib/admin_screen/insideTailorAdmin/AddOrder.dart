import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/FemaleMeasurements.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/measurebutton.dart';
import 'package:silaiproject/model/addordermodel.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  List list = [];
  /* List selectStichList = [
    SelectStich("Blouse", false),
    SelectStich("Suit", false),
    SelectStich("Goan", false),
    SelectStich("Burkha", false),
    SelectStich("Poshak", false),
    SelectStich("Chaniya Choli", false),
    SelectStich("Kurti", false),
    SelectStich("OnePieceDress", false),
    SelectStich("Paticoat", false),
  ];*/

  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

  String? Blouse;
  String? Suit;
  String? Goan;
  String? Burkha;
  String? Poshak;
  String? ChaniyaCholi;
  String? Kurti;
  String? OnePieceDress;
  String? Paticoat;

  final _formkey = GlobalKey<FormState>();

  final Namecontroller = new TextEditingController();
  final Emailcontroller = new TextEditingController();
  final Contactcontroller = new TextEditingController();
  final ClothMaterialcontroller = new TextEditingController();
  final SelectYourStichcontroller = new TextEditingController();
  final DueDateController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Order",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "User Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfa8919),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                nameTextField(),
                SizedBox(
                  height: 25,
                ),
                EmailTextField(),
                SizedBox(
                  height: 15,
                ),
                ContactTextField(),
                SizedBox(
                  height: 15,
                ),
                ClothMaterialTextField(),
                SizedBox(
                  height: 15,
                ),
                DueDate(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Select Your Stich : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Column(children: [
                  Row(
                    children: [
                      Text(
                        "Blouse",
                      ),
                      Checkbox(
                        value: value1,
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value1 = value!;
                            list.add(Blouse);
                          });
                        },
                      ),
                      Text(
                        "Suit",
                      ),
                      Checkbox(
                        value: value2,
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value2 = value!;
                            list.add(Suit);
                          });
                        },
                      ),
                      Text(
                        "Gown",
                      ),
                      Checkbox(
                        value: value3,
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value3 = value!;
                            list.add(Goan);
                          });
                        },
                      ),
                      Text(
                        "Burkha",
                      ),
                      Checkbox(
                        value: value4,
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value4 = value!;
                            list.add(Burkha);
                          });
                        },
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 2,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Poshak",
                        ),
                        Checkbox(
                          value: value5,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value5 = value!;
                              //list.add(Poshak);
                            });
                          },
                        ),
                        Text(
                          "Chaniya Choli",
                        ),
                        Checkbox(
                          value: value6,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value6 = value!;
                              //list.add(ChaniyaCholi);
                            });
                          },
                        ),
                        Text(
                          "Kurti",
                        ),
                        Checkbox(
                          value: value7,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value7 = value!;
                              //list.add(Kurti);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "One Piece Dress",
                        ),
                        Checkbox(
                          value: value8,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value8 = value!;
                              //list.add(OnePieceDress);
                            });
                          },
                        ),
                        Text(
                          "Petticoat",
                        ),
                        Checkbox(
                          value: value9,
                          activeColor: Colors.green,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value9 = value!;
                              //list.add(Paticoat);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          NextButton(),
        ]),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: Namecontroller,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Name";
        }
        return null;
      },
      onSaved: (value) {
        Namecontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.account_circle,
          color: Color.fromARGB(255, 30, 22, 22),
        ),
        hintText: "Name",
      ),
    );
  }

  Widget EmailTextField() {
    return TextFormField(
      controller: Emailcontroller,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Email";
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return "Please enter a valid email";
        }
        return null;
      },
      onSaved: (value) {
        Emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        hintText: "Email",
      ),
    );
  }

  Widget ContactTextField() {
    return TextFormField(
      controller: Contactcontroller,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter contact no.";
        }
        //reg expression for email validation
        if (value.length != 10) {
          return "Mobile Number must be of 10 digit";
        }
      },
      onSaved: (value) {
        Contactcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      minLines: 1,
      maxLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        hintText: "Contact",
      ),
    );
  }

  Widget ClothMaterialTextField() {
    return TextFormField(
      controller: ClothMaterialcontroller,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "ClothMaterial can't be empty";
        }
        return null;
      },
      onSaved: (value) {
        ClothMaterialcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.checkroom,
          color: Colors.black,
        ),
        hintText: "Cloth Material",
      ),
    );
  }

  Widget DueDate() {
    return TextFormField(
      controller: DueDateController,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "DueDate can't be empty";
        }
        return null;
      },
      onSaved: (value) {
        DueDateController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.date_range,
          color: Colors.black,
        ),
        hintText: "DueDate",
      ),
    );
  }

  Widget YourStichTextField() {
    return TextFormField(
      controller: SelectYourStichcontroller,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "YourStich can't be empty";
        }
        return null;
      },
      onSaved: (value) {
        SelectYourStichcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFfa8919),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        hintText: "Select Your Stich",
      ),
    );
  }

  Widget NextButton() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFfa8919),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          addorder();
        },
        child: Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void addorder() async {
    final isValid = _formkey.currentState!.validate();
    var date = DateTime.now().toString();
    if (isValid) {
      _formkey.currentState!.save();
      try {
        final User? user = _auth.currentUser;
        AddOrder1 orderadd = AddOrder1();
        orderadd.Name = Namecontroller.text;
        orderadd.Email = Emailcontroller.text;
        orderadd.Contact = Contactcontroller.text;
        orderadd.ClothMaterial = ClothMaterialcontroller.text;
        orderadd.SelectTheStich = SelectYourStichcontroller.text;
        orderadd.DueDate = DueDateController.text;
        await FirebaseFirestore.instance
            .collection('AddOrder')
            .doc(user?.uid)
            .set(orderadd.toMap());
        Fluttertoast.showToast(msg: "Details added to Database :) ");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const measurements()),
        );
      } catch (error) {
        Fluttertoast.showToast(msg: "Please enter details");
      }
    }
  }
}
