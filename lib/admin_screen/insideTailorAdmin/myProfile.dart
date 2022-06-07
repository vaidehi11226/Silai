import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silaiproject/admin_screen/HomePage1.dart';

class createProfile extends StatefulWidget {
  const createProfile({Key? key}) : super(key: key);

  @override
  State<createProfile> createState() => _createProfileState();
}

class _createProfileState extends State<createProfile> {
  String level = "Female";
  PickedFile? _imagefile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Profile Details",
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
            imageProfile(),
            SizedBox(
              height: 35,
            ),
            nameTextField(),
            SizedBox(
              height: 35,
            ),
            workexperinecTextField(),
            SizedBox(
              height: 35,
            ),
            /*
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stiching done for:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text("Male"),
                    Radio(
                        value: "Male",
                        groupValue: level,
                        onChanged: (value) {
                          setState(() {
                            level = value.toString();
                          });
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("Female"),
                    Radio(
                        value: "Female",
                        groupValue: level,
                        onChanged: (value) {
                          setState(() {
                            level = value.toString();
                          });
                        }),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),*/
            TypesofoutfitsTextField(),
            SizedBox(
              height: 35,
            ),
            SpecialistInTextField(),
            SizedBox(
              height: 50,
            ),
            CreateProfileButton(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70.0,
            backgroundImage:
                _imagefile == null ? null : FileImage(File(_imagefile!.path)),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.add_a_photo_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imagefile = pickedFile!;
    });
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
          Icons.store,
          color: Colors.black,
        ),
        labelText: "Shop Name",
        hintText: "Shop Name",
      ),
    );
  }

  Widget workexperinecTextField() {
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
          Icons.access_time_filled,
          color: Colors.black,
        ),
        labelText: "Experience",
        hintText: "Work Experience",
      ),
    );
  }

  Widget TypesofoutfitsTextField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
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
          Icons.checkroom,
          color: Colors.black,
        ),
        labelText: "Type of Stich",
        hintText: "Types of stich",
      ),
    );
  }

  Widget SpecialistInTextField() {
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
        labelText: "SpecialistIn",
        hintText: "SpecialistIn",
      ),
    );
  }

  Widget CreateProfileButton() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFfa8919),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage1()));
        },
        child: Text(
          "Create Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
