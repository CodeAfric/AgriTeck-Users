class Vendors {
  String name, vendorID, phone, location, image, email, gender;
  List interest;

  Vendors(
      {this.name,
      this.vendorID,
      this.phone,
      this.location,
      this.image,
      this.email,
      this.gender,
      this.interest});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (vendorID != null) {
      map['venderID'] = vendorID;
    }
    map['venderID'] = vendorID;
    map['name'] = name;
    map['phone'] = phone;
    map['location'] = location;
    map['image'] = image;
    map['email'] = email;
    map['interest'] = interest;
    map['gender'] = gender;
    return map;
  }

  Vendors.fromMapObject(Map<String, dynamic> map) {
    this.vendorID = map['vendorID'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.location = map['location'];
    this.image = map['image'];
    this.email = map['email'];
    this.interest = map['interest'];
    this.gender = map['gender'];
  }
}
