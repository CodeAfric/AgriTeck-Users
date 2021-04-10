class InvestorsData {
  String name, investorID, phone, location, image, email;
  List interest;

  InvestorsData(
      {this.name,
      this.investorID,
      this.phone,
      this.location,
      this.image,
      this.email,
      this.interest});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (investorID != null) {
      map['investorID'] = investorID;
    }
    map['investorID'] = investorID;
    map['name'] = name;
    map['phone'] = phone;
    map['location'] = location;
    map['image'] = image;
    map['email'] = email;
    map['interest'] = interest;
    return map;
  }

  InvestorsData.fromMapObject(Map<String, dynamic> map) {
    this.investorID = map['investorID'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.location = map['location'];
    this.image = map['image'];
    this.email = map['email'];
    this.interest = map['interest'];
  }
}
