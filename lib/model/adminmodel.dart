class AdminModel {
  String? Name;
  String? Email;

  AdminModel({this.Name, this.Email});

  //data from server
  factory AdminModel.fromMap(map) {
    return AdminModel(
      Name: map['Name'],
      Email: map['Email-Id'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Email-Id': Email,
    };
  }
}
