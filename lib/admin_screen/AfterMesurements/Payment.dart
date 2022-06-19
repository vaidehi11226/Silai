import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/Bill.dart';
import 'package:silaiproject/model/Pricedatamodel.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final PriceController1 = new TextEditingController();
  final PriceController2 = new TextEditingController();
  final PriceController3 = new TextEditingController();

  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
  List<String> cloth = <String>[
    'Blouse',
    'Suit',
    'Gaon',
    'Burkha',
    'Poshak',
    'ChaniyaCholi',
    'Paticoat',
    'Kurti',
    'Nothing',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfa8919),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Payment",
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
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SelectedCloth1(),
                  SizedBox(
                    height: 30,
                  ),
                  Price1(),
                  SizedBox(
                    height: 40,
                  ),
                  SelectedCloth2(),
                  SizedBox(
                    height: 30,
                  ),
                  Price2(),
                  SizedBox(
                    height: 40,
                  ),
                  SelectedCloth3(),
                  SizedBox(
                    height: 30,
                  ),
                  Price3(),
                  SizedBox(
                    height: 50,
                  ),
                  bill(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget SelectedCloth1() {
    return Container(
      width: 150,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButton(
                hint: dropdownvalue1 == null
                    ? Text(
                        'Selected Stich',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        dropdownvalue1!,
                        style: TextStyle(color: Colors.blue),
                      ),
                // Initial Value
                value: dropdownvalue1,
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
                    dropdownvalue1 = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SelectedCloth2() {
    return Container(
      width: 150,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButton(
                hint: dropdownvalue2 == null
                    ? Text(
                        'Selected Stich',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        dropdownvalue2!,
                        style: TextStyle(color: Colors.blue),
                      ),
                // Initial Value
                value: dropdownvalue2,
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
                    dropdownvalue2 = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget SelectedCloth3() {
    return Container(
      width: 150,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: DropdownButton(
                hint: dropdownvalue3 == null
                    ? Text(
                        'Selected Stich',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        dropdownvalue3!,
                        style: TextStyle(color: Colors.blue),
                      ),
                // Initial Value
                value: dropdownvalue3,
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
                    dropdownvalue3 = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Price1() {
    return Container(
      width: 330,
      height: 50,
      child: TextFormField(
        controller: PriceController1,
        autofocus: false,
        validator: (value) {
          if (value!.isEmpty) {
            return "Price can't be empty";
          }
          return null;
        },
        onSaved: (value) {
          PriceController1.text = value!;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFfa8919),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            Icons.money,
            color: Colors.black,
          ),
          hintText: "Price",
        ),
      ),
    );
  }

  Widget Price2() {
    return Container(
      width: 330,
      height: 50,
      child: TextFormField(
        controller: PriceController2,
        autofocus: false,
        validator: (value) {
          if (value!.isEmpty) {
            return "Price can't be empty";
          }
          return null;
        },
        onSaved: (value) {
          PriceController1.text = value!;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFfa8919),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            Icons.money,
            color: Colors.black,
          ),
          hintText: "Price",
        ),
      ),
    );
  }

  Widget Price3() {
    return Container(
      width: 330,
      height: 50,
      child: TextFormField(
        controller: PriceController3,
        autofocus: false,
        validator: (value) {
          if (value!.isEmpty) {
            return "Price can't be empty";
          }
          return null;
        },
        onSaved: (value) {
          PriceController3.text = value!;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFfa8919),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: Icon(
            Icons.money,
            color: Colors.black,
          ),
          hintText: "Price",
        ),
      ),
    );
  }

  Widget bill() {
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
          "Proceed for Bill",
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
        PaymentModel payadd = new PaymentModel();
        payadd.dropdown1 = dropdownvalue1;
        payadd.Price1 = PriceController1.text;
        payadd.dropdown2 = dropdownvalue2;
        payadd.Price2 = PriceController2.text;
        payadd.dropdown3 = dropdownvalue3;
        payadd.Price3 = PriceController3.text;

        await FirebaseFirestore.instance
            .collection('Payment')
            .doc(user?.uid)
            .set(payadd.toMap());
        Fluttertoast.showToast(msg: "Details added to Database :) ");
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Bill()), (route) => false);
      } catch (error) {
        Fluttertoast.showToast(msg: "Please enter details");
      }
    }
  }
}
