class BillModel {
  String? BillNo;
  String? username;
  String? usercontact;
  String? Stichwithprice;
  String? TotalStich;
  String? TotalPrice;
  String? AdvancedPaid;
  String? Customizeurl;

  BillModel({
    this.BillNo,
    this.username,
    this.usercontact,
    this.Stichwithprice,
    this.TotalStich,
    this.TotalPrice,
    this.AdvancedPaid,
    this.Customizeurl,
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
      Customizeurl: map['customizeurl'],
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
      'customizeurl': Customizeurl,
    };
  }
}
