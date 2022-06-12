class ProfileAdmin {
  String? uid;
  String? url;
  String? ShopName;
  String? Contact;
  String? Address;
  String? Experience;
  String? Typeofstich;
  String? Specialistin;

  ProfileAdmin({
    this.uid,
    this.url,
    this.ShopName,
    this.Contact,
    this.Address,
    this.Experience,
    this.Typeofstich,
    this.Specialistin,
  });

  factory ProfileAdmin.fromMap(map) {
    return ProfileAdmin(
      uid: map['uid'],
      url: map['url'],
      ShopName: map['shopname'],
      Contact: map['Contact'],
      Address: map['Address'],
      Experience: map['experience'],
      Typeofstich: map['TypeofStich'],
      Specialistin: map['Specialistin'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'url': url,
      'shopname': ShopName,
      'Contact': Contact,
      'Address': Address,
      'experience': Experience,
      'typeofstich': Typeofstich,
      'specialistin': Specialistin,
    };
  }
}
