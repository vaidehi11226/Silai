class BillModel {
  String? BillNo;
  String? username;
  String? usercontact;
  String? Stichwithprice;
  String? TotalStich;
  String? TotalPrice;
  String? AdvancedPaid;

  BillModel({
    this.BillNo,
    this.username,
    this.usercontact,
    this.Stichwithprice,
    this.TotalStich,
    this.TotalPrice,
    this.AdvancedPaid,
  });

  factory BillModel.fromMap(map) {
    return BillModel(
      BillNo: map['billno'],
      username: map['username'],
      usercontact: map['usercontact'],
      Stichwithprice: map['Stichwprice'],
      TotalStich: map['totalStich'],
      TotalPrice: map['totalPrice'],
      AdvancedPaid: map['advancepaid'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'billno': BillNo,
      'username': username,
      'usercontact': usercontact,
      'Stichwprice': Stichwithprice,
      'totalStich': TotalStich,
      'totalPrice': TotalPrice,
      'advancepaid': AdvancedPaid,
    };
  }
}
