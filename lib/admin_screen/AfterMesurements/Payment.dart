import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/AfterMesurements/Bill.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 100,
                ),
                SelectedCloth1(),
                SizedBox(
                  height: 30,
                ),
                Price(),
                SizedBox(
                  height: 40,
                ),
                SelectedCloth2(),
                SizedBox(
                  height: 30,
                ),
                Price(),
                SizedBox(
                  height: 40,
                ),
                SelectedCloth3(),
                SizedBox(
                  height: 30,
                ),
                Price(),
                SizedBox(
                  height: 50,
                ),
                bill(),
              ],
            ),
          ],
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

  Widget Price() {
    return Container(
      width: 330,
      height: 50,
      child: TextFormField(
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bill()));
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
}
