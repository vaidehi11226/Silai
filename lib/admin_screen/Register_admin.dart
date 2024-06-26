import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:silaiproject/admin_screen/HomePage1.dart';
import 'package:silaiproject/admin_screen/insideTailorAdmin/myProfile1.dart';
import 'package:silaiproject/model/adminmodel.dart';
import 'package:silaiproject/model/usermodel.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({Key? key}) : super(key: key);

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
  final _formkey = GlobalKey<FormState>();

  final usernameEditingController = new TextEditingController();
  final EmailidEditingController = new TextEditingController();
  final PasswordEditingController = new TextEditingController();
  final ConPasswordEditingController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Name";
        }
        return null;
      },
      onSaved: (value) {
        usernameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
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

    final EmailField = TextFormField(
      autofocus: false,
      controller: EmailidEditingController,
      keyboardType: TextInputType.emailAddress,
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
        EmailidEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Email-Id as @admin.com",
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

    final passwordField = TextFormField(
      obscureText: true,
      controller: PasswordEditingController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return "Please enter your Password";
        }
        if (!regex.hasMatch(value)) {
          return "Enter Valid Password(Min. 6 Character)";
        }
      },
      onSaved: (value) {
        PasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        /*suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )),*/
        prefixIconColor: Color(0xFF063448),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
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

    final ConPasswordField = TextFormField(
      autofocus: false,
      controller: ConPasswordEditingController,
      obscureText: obscureText,
      validator: (value) {
        if (ConPasswordEditingController.text !=
            PasswordEditingController.text) {
          return "Password Don't match";
        }
        return null;
      },
      onSaved: (value) {
        ConPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        prefixIconColor: Color(0xFFfa8919),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
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

    final SignupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: Color(0xFFfa8919),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signup(EmailidEditingController.text, PasswordEditingController.text);
        },
        child: Text(
          "Sign-up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formkey,
                //autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfa8919),
                      ),
                    ),
                    SizedBox(
                        height: 300,
                        child: Image.asset(
                          "images/sewing2.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    nameField,
                    SizedBox(
                      height: 15,
                    ),
                    EmailField,
                    SizedBox(
                      height: 15,
                    ),
                    passwordField,
                    SizedBox(
                      height: 15,
                    ),
                    ConPasswordField,
                    SizedBox(
                      height: 45,
                    ),
                    SignupButton,
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signup(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling user model
    //sending values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    AdminModel adminModel = AdminModel();

    //writing values
    adminModel.Name = usernameEditingController.text;
    adminModel.Email = user?.email;
    await firebaseFirestore
        .collection("admin")
        .doc(user?.uid)
        .set(adminModel.toMap());
    Fluttertoast.showToast(msg: "Account created succesfully :) ");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MyProfile()), (route) => false);
  }
}
