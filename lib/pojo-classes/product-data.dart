class Product {
  String productName, measure, productId, timeStamp, productDescription;
  int quantity;
  double price;
  Map<String, dynamic> farmer;
  List images;
  Product(
      {this.productName,
      this.measure,
      this.productId,
      this.timeStamp,
      this.productDescription,
      this.quantity,
      this.price,
      this.farmer,
      this.images});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['productName'] = productName;
    map['measure'] = measure;
    map['productId'] = productId;
    map['timeStamp'] = timeStamp;
    map['productDescription'] = productDescription;
    map['quantity'] = quantity;
    map['price'] = price;
    map['farmer'] = farmer;
    map['images'] = images;
    return map;
  }

  Product.fromMapObject(Map<String, dynamic> map) {
    this.productName = map['productName'];
    this.measure = map['measure'];
    this.productId = map['productId'];
    this.timeStamp = map['timeStamp'];
    this.productDescription = map['productDescription'];
    this.quantity = map['quantity'];
    this.price = map['price'];
    this.farmer = map['farmer'];
    this.images = map['images'];
  }
}
