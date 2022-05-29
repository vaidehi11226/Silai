import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FemaleMesure extends StatefulWidget {
  const FemaleMesure({Key? key}) : super(key: key);

  @override
  State<FemaleMesure> createState() => _FemaleMesureState();
}

class _FemaleMesureState extends State<FemaleMesure> {
  var clothes = [
    "Blouse",
    "Suit",
    "Goan",
    "Burkha",
    "Poshak",
    "ChaniyaCholi",
    "Paticoat",
    "Kurti"
  ];
  String _selectedcloth = "Blouse";

  /*@override
  void initState() {
    super.initState();

    this.clothes.add({"id": 1, "name": "Blouse"});
    this.clothes.add({"id": 2, "name": "Suit"});
    this.clothes.add({"id": 3, "name": "Goan"});
    this.clothes.add({"id": 4, "name": "Burkha"});
    this.clothes.add({"id": 5, "name": "Poshak"});
    this.clothes.add({"id": 6, "name": "ChaniyaCholi"});
    this.clothes.add({"id": 7, "name": "Paticoat"});
    this.clothes.add({"id": 8, "name": "Kurti"});
  }*/

  @override
  Widget build(BuildContext context) {
    var clothesId;
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
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                clothselect(),
                SizedBox(
                  height: 20,
                ),
                clothselect(),
                SizedBox(
                  height: 20,
                ),
                clothselect(),
              ],
            ),
            Column(
              children: [
                SingleChildScrollView(
                  child: ListView(
                    children: <Widget>[
                      /* Row(),
                      Row(),
                      Row(),
                      Row(),
                      Row(),
                      Row(),
                      Row(),
                      Row(),
                      Row(),*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget clothselect() {
    return Column(
      children: [
        Text("Select Type of Stich"),
        SizedBox(
          height: 10,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              // Initial Value
              value: _selectedcloth,
              style: TextStyle(color: Colors.white),
              underline: Container(),
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              dropdownColor: Colors.black,
              // Down Arrow Icon

              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: clothes.map((String clothes) {
                return DropdownMenuItem(
                  value: clothes,
                  child: Text(clothes),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  _selectedcloth = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
        /*body: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Neck",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Elbow",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Arm Length",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Armhole Depth",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Wrist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Bust",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Waist",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Hip",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        colthselect(),
                        /*DropdownButton<String>(
                              value: clothesval,
                              isExpanded: false,
                              items: <String>[
                                "Blouse",
                                "Suit",
                                "Goan",
                                "Burkha",
                                "Poshak",
                                "ChaniyaCholi",
                                "Paticoat",
                                "Kurti"
                              ].map<DropdownMenuItem<String>>((clothesval) {
                                return DropdownMenuItem(
                                  value: clothesval,
                                  child: Text(clothesval),
                                );
                              }).toList(),
                              style: TextStyle(fontSize: 15, color: Colors.black),
                              onChanged: (clothesval) => this.clothesval = clothesval),
                          Column(
                            children: [
                              FormHelper.dropDownWidget(
                                context,
                                "Select Type of Stich",
                                this.clothesId,
                                this.clothes,
                                (onChangedVal) {
                                  this.clothesId = onChangedVal;
                                  print("Selected Type of Stich:  $onChangedVal");
                                },
                                (onValidateVal) {
                                  if (onValidateVal == null) {
                                    return "Please Select Type of Stich";
                                  }
                                  return null;
                                },
                                borderColor: Theme.of(context).primaryColor,
                                borderFocusColor: Theme.of(context).primaryColor,
                                borderRadius: 5,
                                optionValue: "val",
                                optionLabel: "name",
                              )
                            ],
                          ),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
            /*SizedBox(
              height: 15,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                width: 70,
                height: 40,
              ),
              child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.black,
                          border: OutlineInputBorder(),
                        ),
                      ),*/
          ),
          //],
          // ),
          //),
          //),
          //),
        ),
      ),
    );
  }*/
/*Widget colthselect() {
    return Column(
      children: [
        Text("Select Type of Stich"),
        SizedBox(
          height: 10,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              // Initial Value
              value: _selectedcloth,
              style: TextStyle(color: Colors.white),
              underline: Container(),
              borderRadius: BorderRadius.circular(5),
              isExpanded: true,
              dropdownColor: Colors.black,
              // Down Arrow Icon

              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: clothes.map((String clothes) {
                return DropdownMenuItem(
                  value: clothes,
                  child: Text(clothes),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  _selectedcloth = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
  
}*/
