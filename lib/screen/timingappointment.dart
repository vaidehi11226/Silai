import 'package:flutter/material.dart';

class Time_Appoint extends StatefulWidget {
  const Time_Appoint({Key? key}) : super(key: key);

  @override
  State<Time_Appoint> createState() => _Time_AppointState();
}

class _Time_AppointState extends State<Time_Appoint> {
  @override
  TimeOfDay currentTime = TimeOfDay.now();
  bool _isSelected = false;

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.timer),
              trailing: Icon(Icons.edit),
              title: _isSelected
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
              title: Text("Select your Date"),
              onTap: () {},
            ),
          ),
        ],
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
        _isSelected = true;
      });
    }
  }
}
