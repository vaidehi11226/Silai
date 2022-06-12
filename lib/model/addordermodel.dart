class AddOrder1 {
  String? uid;
  String? Name;
  String? Email;
  String? Contact;
  String? ClothMaterial;
  String? SelectTheStich;

  AddOrder1({
    this.uid,
    this.Name,
    this.Email,
    this.Contact,
    this.ClothMaterial,
    this.SelectTheStich,
  });

  factory AddOrder1.fromMap(map) {
    return AddOrder1(
      uid: map['uid'],
      Name: map['Name'],
      Email: map['Email'],
      ClothMaterial: map['ClothMaterial'],
      SelectTheStich: map['SelectTheStich'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Name': Name,
      'Email': Email,
      'ClothMaterial': ClothMaterial,
      'SelectTheStich': SelectTheStich,
    };
  }
}
