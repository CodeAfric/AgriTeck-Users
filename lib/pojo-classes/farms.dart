class Farms {
  String farmerId,farmId,description;
  List<Map<String,dynamic>> farmState;
  String images, cropType;
  double farmSize;
  String location;

  Farms({this.farmerId,this.farmId,this.description,  this.farmState, this.images, this.cropType,
    this.farmSize, this.location});

  // Convert a Farmer object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['farmerId'] = farmerId;
    map['farmId'] = farmId;
    map['images'] = images;
    map['description'] = description;
    map['farmState'] = farmState;
    map['cropType'] = cropType;
    map['farmSize'] = farmSize;
    map['location'] = location;
    return map;
  }
  Farms.fromMapObject(Map<String, dynamic> map) {
    this.farmerId = map['farmerId'];
    this.farmId = map['farmId'];
    this.location = map['location'];
    this.images = map['images'];
    this.description=map['description'];
    this.farmSize = map['farmSize'];
    this.farmState=map['farmState'];
    this.cropType=map['cropType'];
    this.cropType=map['cropType'];
  }
}