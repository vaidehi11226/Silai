import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class FemaleMesure extends StatefulWidget {
  const FemaleMesure({Key? key}) : super(key: key);

  @override
  State<FemaleMesure> createState() => _FemaleMesureState();
}

class _FemaleMesureState extends State<FemaleMesure> {
  List<String> clothes = [
    "Blouse",
    "Suit",
    "Goan",
    "Burkha",
    "Poshak",
    "ChaniyaCholi",
    "Paticoat",
    "Kurti"
  ];
  //late String _selectedcloth;

  String? clothesval;

  /*@override
  void initState() {
    super.initState();

    this.clothes.add({"val": 1, "name": "Blouse"});
    this.clothes.add({"val": 2, "name": "Suit"});
    this.clothes.add({"val": 3, "name": "Goan"});
    this.clothes.add({"val": 4, "name": "Burkha"});
    this.clothes.add({"val": 5, "name": "Poshak"});
    this.clothes.add({"val": 6, "name": "ChaniyaCholi"});
    this.clothes.add({"val": 7, "name": "Paticoat"});
    this.clothes.add({"val": 8, "name": "Kurti"});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Neck",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Elbow",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Arm Length",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Armhole Depth",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Wrist",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Bust",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Waist",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hip",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        /*child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 100.0,
            height: 100.0,
            child: ListView(
              children: <Widget>[
                DropdownButton<String>(
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
    );
  }
}
