import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:silaiproject/screen_user/HomePage1.dart';
//enum serviceGroup { homeservice, shopservice }

class Appoitnmentstatus extends StatefulWidget {
  const Appoitnmentstatus({Key? key}) : super(key: key);

  @override
  State<Appoitnmentstatus> createState() => _AppoitnmentstatusState();
}

class _AppoitnmentstatusState extends State<Appoitnmentstatus> {
  String level = "Shopservice";
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime currentDate = DateTime.now();
  bool _isTimeSelected = false;
  bool _isDateSelected = false;

  var pickedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Appointments",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.timer),
                trailing: Icon(Icons.edit),
                title: _isTimeSelected
                    ? Text('${currentTime.format(context).toString()}')
                    : Text("Select your Time"),
                onTap: () {
                  _selectTime(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                trailing: Icon(Icons.edit),
                title: _isDateSelected
                    ? Text(DateFormat('EEE, M/d/y').format(currentDate))
                    : Text("Select your Date"),
                onTap: () {
                  _selectDate(context);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("     Home Service"),
                    Radio(
                        value: "HomeService",
                        groupValue: level,
                        onChanged: (value) {
                          setState(() {
                            level = value.toString();
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("     Shop Service"),
                    Radio(
                        value: "ShopService",
                        groupValue: level,
                        onChanged: (value) {
                          setState(() {
                            level = value.toString();
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            BookButton(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Choose your Time',
      confirmText: 'Choose now',
      cancelText: 'Later',
    );
    if (pickedTime != null && pickedTime != currentTime) {
      setState(() {
        currentTime = pickedTime;
        _isTimeSelected = true;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      //initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Choose your Date',
      confirmText: 'Choose now',
      cancelText: 'Later',
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
        _isDateSelected = true;
      });
    }
  }

  Widget BookButton() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFfa8919),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Fluttertoast.showToast(
            msg: "Appointment Booked Successfully!!!",
            textColor: Colors.white60,
            backgroundColor: Colors.black,
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage1(),
            ),
            (route) => false,
          );
        },
        child: Text(
          "Book",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
