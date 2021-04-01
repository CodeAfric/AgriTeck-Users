class Farmers {
  String name, location, telephone, farmerId, gender;
  int numFarms;
  String img;
  double farmSize;
  int age;
  String specialized;
  Farmers(
      {this.gender,
      this.farmerId,
      this.name,
      this.location,
      this.telephone,
      this.numFarms,
      this.img,
      this.age,
      this.farmSize,
      this.specialized});

  // Convert a Farmer object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (farmerId != null) {
      map['farmerId'] = farmerId;
    }
    map['name'] = name;
    map['telephone'] = telephone;
    map['location'] = location;
    map['numFarms'] = numFarms;
    map['img'] = img;
    map['farmSize'] = farmSize;
    map['age'] = age;
    map['gender'] = gender;
    map['specialized'] = specialized;
    return map;
  }

  Farmers.fromMapObject(Map<String, dynamic> map) {
    this.name = map['name'];
    this.telephone = map['telephone'];
    this.location = map['location'];
    this.numFarms = map['numFarms'];
    this.img = map['img'];
    this.farmSize = map['farmSize'];
    this.age = map['age'];
    this.gender = map['gender'];
    this.specialized = map['specialized'];
  }
}
