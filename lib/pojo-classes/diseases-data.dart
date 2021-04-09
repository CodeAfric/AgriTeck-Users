class Disease {
  String name, description, diseaseId;
  List images;
  List causes, signs, treatment, preventiveM, affectedPlants;

  Disease(
      {this.diseaseId,
      this.name,
      this.description,
      this.images,
      this.affectedPlants,
      this.causes,
      this.signs,
      this.treatment,
      this.preventiveM});

  // Convert a Farmer object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['_id'] = diseaseId;
    map['name'] = name;
    map['description'] = description;
    map['images'] = images;
    map['causes'] = causes;
    map['signs'] = signs;
    map['treatment'] = treatment;
    map['preventiveM'] = preventiveM;
    return map;
  }

  Disease.fromMapObject(Map<String, dynamic> map) {
    this.diseaseId = map['_id'];
    this.name = map['name'];
    this.description = map['description'];
    this.images = map['images'];
    this.preventiveM = map['preventiveM'];
    this.signs = map['signs'];
    this.treatment = map['treatment'];
    this.causes = map['causes'];
    this.affectedPlants = map['affected_plants'];
  }
}

class Farmers {
  String name, location, telephone, farmerId;
  int numFarms;
  String img;
  double farmSize;
  int age;
  String specialized;
  Farmers(
      {this.farmerId,
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
    this.specialized = map['specialized'];
  }
}

class Farms {
  String farmerId, farmId, description;
  List<Map<String, dynamic>> farmState;
  List images, cropType;
  double farmSize;
  String location;

  Farms(
      {this.farmerId,
      this.farmId,
      this.description,
      this.farmState,
      this.images,
      this.cropType,
      this.farmSize,
      this.location});

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
    this.description = map['description'];
    this.farmSize = map['farmSize'];
    this.farmState = map['farmState'];
    this.cropType = map['cropType'];
    this.cropType = map['cropType'];
  }
}

class Community {
  String userImage,
      name,
      location,
      date,
      question,
      occupation,
      description,
      postId,
      relatedCrop;
  List images;
  Community(
      {this.userImage,
      this.images,
      this.name,
      this.location,
      this.date,
      this.question,
      this.description,
      this.occupation,
      this.postId,
      this.relatedCrop});
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['userImage'] = userImage;
    map['images'] = images;
    map['name'] = name;
    map['description'] = description;
    map['date'] = date;
    map['question'] = question;
    map['occupation'] = occupation;
    map['location'] = location;
    map['postId'] = postId;
    map['relatedCrop'] = relatedCrop;
    return map;
  }

  Community.fromMapObject(Map<String, dynamic> map) {
    this.userImage = map['userImage'];
    this.name = map['name'];
    this.location = map['location'];
    this.images = map['images'];
    this.description = map['description'];
    this.date = map['date'];
    this.question = map['question'];
    this.occupation = map['occupation'];
    this.postId = map['postId'];
    this.relatedCrop = map['relatedCrop'];
  }
}

class Comments {
  String commentId,
      postId,
      senderName,
      senderId,
      senderImage,
      message,
      timeStamp,
      messageImages,
      senderLocation;
  Comments(
      {this.senderName,
      this.senderId,
      this.senderImage,
      this.message,
      this.postId,
      this.timeStamp,
      this.messageImages,
      this.commentId,
      this.senderLocation});
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['senderImage'] = senderImage;
    map['senderId'] = senderId;
    map['senderName'] = senderName;
    map['timeStamp'] = timeStamp;
    map['message'] = message;
    map['messageImages'] = messageImages;
    map['postId'] = postId;
    map['commentId'] = commentId;
    map['senderLocation'] = senderLocation;
    return map;
  }

  Comments.fromMapObject(Map<String, dynamic> map) {
    this.senderImage = map['senderImage'];
    this.senderId = map['senderId'];
    this.senderName = map['senderName'];
    this.timeStamp = map['timeStamp'];
    this.message = map['message'];
    this.messageImages = map['messageImages'];
    this.postId = map['postId'];
    this.commentId = map['commentId'];
    this.senderLocation = map['senderLocation'];
  }
}

class Market {
  String productName, measure, productId, timeStamp, productDescription;
  int quantity;
  double price;
  Map<String, dynamic> farmer;
  List images;

  Market(
      {this.productName,
      this.measure,
      this.productId,
      this.timeStamp,
      this.quantity,
      this.price,
      this.farmer,
      this.images,
      this.productDescription});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['productName'] = productName;
    map['measure'] = measure;
    map['productId'] = productId;
    map['timeStamp'] = timeStamp;
    map['quantity'] = quantity;
    map['price'] = price;
    map['farmer'] = farmer;
    map['images'] = images;
    map['productDescription'] = productDescription;
    return map;
  }

  Market.fromMapObject(Map<String, dynamic> map) {
    this.productName = map['productName'];
    this.measure = map['measure'];
    this.productId = map['productId'];
    this.timeStamp = map['timeStamp'];
    this.quantity = map['quantity'];
    this.price = map['price'];
    this.farmer = map['farmer'];
    this.images = map['images'];
    this.productDescription = map['productDescription'];
  }
}

class Crops {
  String cropName, cropId, prefereSoil, cropDescription;
  List cropSpecies, cropPestAndDisease, tips;

  Crops(
      {this.cropName,
      this.cropId,
      this.prefereSoil,
      this.cropDescription,
      this.cropSpecies,
      this.cropPestAndDisease,
      this.tips});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['cropName'] = cropName;
    map['cropId'] = cropId;
    map['prefereSoil'] = prefereSoil;
    map['cropDescription'] = cropDescription;
    map['cropSpecies'] = cropSpecies;
    map['cropPestAndDisease'] = cropPestAndDisease;
    map['tips'] = tips;
    return map;
  }

  Crops.fromMapObject(Map<String, dynamic> map) {
    this.cropName = map['cropName'];
    this.cropId = map['cropId'];
    this.prefereSoil = map['prefereSoil'];
    this.cropDescription = map['cropDescription'];
    this.cropSpecies = map['cropSpecies'];
    this.cropPestAndDisease = map['cropPestAndDisease'];
    this.tips = map['tips'];
  }
}
