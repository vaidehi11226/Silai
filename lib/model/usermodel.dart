class UserModel {
  String? Name;
  String? Contact;
  String? Email;
  String? Address;

  UserModel({this.Name, this.Contact, this.Email, this.Address});

  //data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      Name: map['Name'],
      Contact: map['Contact'],
      Email: map['Email-Id'],
      Address: map['Address'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Contact': Contact,
      'Email-Id': Email,
      'Address': Address,
    };
  }
}
