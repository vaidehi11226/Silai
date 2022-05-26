import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/Mesurements/FemaleMeasurements.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;

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
            height: 40,
          ),
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
            height: 80,
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
                    });
                  },
                ),
                Text(
                  "Goan",
                ),
                Checkbox(
                  value: value3,
                  activeColor: Colors.green,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value3 = value!;
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
                      });
                    },
                  ),
                  Text(
                    "Paticoat",
                  ),
                  Checkbox(
                    value: value9,
                    activeColor: Colors.green,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value9 = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
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

  Widget YourStichTextField() {
    return TextFormField(
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FemaleMesure()));
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
}
