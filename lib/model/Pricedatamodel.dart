class PaymentModel {
  String? dropdown1;
  String? Price1;
  String? dropdown2;
  String? Price2;
  String? dropdown3;
  String? Price3;

  PaymentModel({
    this.dropdown1,
    this.Price1,
    this.dropdown2,
    this.Price2,
    this.dropdown3,
    this.Price3,
  });

  //data from server
  factory PaymentModel.fromMap(map) {
    return PaymentModel(
      dropdown1: map['dropvalue1'],
      Price1: map['Price1'],
      dropdown2: map['dropvalue2'],
      Price2: map['Price2'],
      dropdown3: map['dropvalue3'],
      Price3: map['Price3'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'dropvalue1': dropdown1,
      'Price1': Price1,
      'dropvalue2': dropdown2,
      'Price2': Price2,
      'dropvalue3': dropdown3,
      'Price3': Price3,
    };
  }
}
