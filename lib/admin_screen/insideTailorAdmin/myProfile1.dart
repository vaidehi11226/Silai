import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:silaiproject/admin_screen/HomePage1.dart';
import 'package:silaiproject/model/Profileadminmodel.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  XFile? _imagefile;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String? url;

  final ShopNameEditingController = new TextEditingController();
  final ExperienceEditingController = new TextEditingController();
  final TypeofstichEditingController = new TextEditingController();
  final SpecialistINEditingController = new TextEditingController();
  final AddressEditingController = new TextEditingController();
  final ContactEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formkey,
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
                ContactField(),
                SizedBox(
                  height: 35,
                ),
                AddressField(),
                SizedBox(
                  height: 35,
                ),
                workexperinecTextField(),
                SizedBox(
                  height: 35,
                ),
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
            backgroundImage: _imagefile == null
                ? null
                : FileImage(io.File(_imagefile!.path)),
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
        child: Column(children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //FlatButton.icon(
          //icon: Icon(Icons.camera),
          //onPressed: () {
          //takePhoto(ImageSource.camera);
          //},
          //label: Text("Camera"),
          //),
          FlatButton.icon(
            icon: Icon(Icons.image),
            onPressed: () async {
              _imagefile = await imagePicker();
              if (_imagefile != null && _imagefile!.path.isNotEmpty) {
                setState(() {});
              }
            },
            label: Text("Gallery"),
          ),
        ])
        //],
        //),
        );
  }

  Future<XFile?> imagePicker() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Widget nameTextField() {
    return TextFormField(
      controller: ShopNameEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Shop Name is Required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        ShopNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
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

  Widget ContactField() {
    return TextFormField(
      autofocus: false,
      controller: ContactEditingController,
      keyboardType: TextInputType.phone,
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
        ContactEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contact",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color(0xFFfa8919)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget AddressField() {
    return TextFormField(
      autofocus: false,
      controller: AddressEditingController,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 5,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Address ";
        }
      },
      onSaved: (value) {
        AddressEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_city_rounded,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Address",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color(0xFFfa8919)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFfa8919)),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget workexperinecTextField() {
    return TextFormField(
      controller: ExperienceEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Experience is Required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        ExperienceEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
      controller: TypeofstichEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Type of Stich is Required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        TypeofstichEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
      controller: SpecialistINEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return "SpecialistIn field is Required";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        SpecialistINEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
          addProfile();
          //if (_formkey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          //ScaffoldMessenger.of(context).showSnackBar(
          //const SnackBar(content: Text('Processing Data')),
          //);
          // }
          //Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => HomePage1()));
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

  void addProfile() async {
    final isValid = _formkey.currentState!.validate();
    var date = DateTime.now().toString();
    if (isValid) {
      _formkey.currentState!.validate();
      try {
        if (_imagefile == null) {
          Text('Please Select an image');
        } else {
          setState(() {
            _isLoading == true;
          });
          final ref = FirebaseStorage.instance
              .ref()
              .child('/Profile Image')
              .child(_imagefile!.path.toString());

          await ref.putFile(io.File(_imagefile!.path));
          url = await ref.getDownloadURL();

          //firestore add details
          final User? user = _auth.currentUser;
          ProfileAdmin profileAdmin = ProfileAdmin();
          profileAdmin.url = url;
          profileAdmin.ShopName = ShopNameEditingController.text;
          profileAdmin.Contact = ContactEditingController.text;
          profileAdmin.Address = AddressEditingController.text;
          profileAdmin.Experience = ExperienceEditingController.text;
          profileAdmin.Typeofstich = TypeofstichEditingController.text;
          profileAdmin.Specialistin = SpecialistINEditingController.text;
          await FirebaseFirestore.instance
              .collection('adminProfile')
              .doc(user?.uid)
              .set(profileAdmin.toMap());
          Fluttertoast.showToast(msg: "Profile Created Successfully :) ");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage1()),
              (route) => false);
        }
      } catch (error) {
        print('error occured ${error}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
