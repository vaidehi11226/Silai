class AdminModel {
  String? uid;
  String? Name;
  String? Contact;
  String? Email;
  String? Address;

  AdminModel({this.Name, this.Contact, this.Email, this.Address, this.uid});

  //data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
      uid: map['uid'],
      Name: map['Name'],
      Contact: map['Contact'],
      Email: map['Email-Id'],
      Address: map['Address'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'quid': uid,
      'Name': Name,
      'Contact': Contact,
      'Email-Id': Email,
      'Address': Address,
    };
  }
}
