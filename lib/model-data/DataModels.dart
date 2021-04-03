import 'package:flutter/material.dart';

class CommunityData {
  final String postImage;
  final String userImage;
  final String userName;
  final String userLocation;
  final String postTime;
  final String cropName;
  final String postTitle;
  final String postDescription;

  CommunityData(
      {this.postImage,
      this.userImage,
      this.userName,
      this.userLocation,
      this.postTime,
      this.cropName,
      this.postTitle,
      this.postDescription});
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

class ComunityComent {
  final String comenterName;
  final String comenterImage;
  final String comenterLocation;
  final String comenterTime;
  final String coment;

  ComunityComent(
      {this.comenterName,
      this.comenterImage,
      this.comenterLocation,
      this.comenterTime,
      this.coment});

  List<ComunityComent> posts() {
    ComunityComent(
      comenterImage: 'assets/diseases/farmer1.jpg',
      comenterName: 'Kojo Rokoto',
      comenterLocation: 'Abetifi tooorr',
      comenterTime: '12/01/2021',
      coment:
          'this happened as a result of drought. it can also be that the chemical you used to spray it from the beginig '
          'has an effect on it.',
    );
  }
}

class GenerateData {
  List<CommunityData> community() {
    List<CommunityData> data = [
      CommunityData(
        userName: 'Kwame Addison Boat',
        userImage: 'assets/diseases/farmer1.jpg',
        userLocation: 'Tanoso Kumasi ',
        postImage: 'assets/diseases/disease2.jpg',
        postTime: '12/02/2021',
        postTitle: 'Why this on my crop?',
        postDescription:
            'I saw this on my crop earlier today. all the leaves of the crop have holes in them',
        cropName: 'Tomatoes',
      )
    ];
    return data;
  }
}

class GetComent {
  List<ComunityComent> posts() {
    List<ComunityComent> comentData = [
      ComunityComent(
        comenterImage: 'assets/diseases/farmer1.jpg',
        comenterName: 'Kojo Rokoto',
        comenterLocation: 'Abetifi tooorr',
        comenterTime: '12/01/2021',
        coment:
            'this happened as a result of drought. it can also be that the chemical you used to spray it from the beginig '
            'has an effect on it.',
      )
    ];
    return comentData;
  }
}

class Investors {
  String investorName, investorId, investorphone, investorLocation, investorImage, investorEmail;
  List investorInterest;

  Investors(
      {this.investorName,
        this.investorId,
        this.investorphone,
        this.investorLocation,
        this.investorImage,
        this.investorEmail,
        this.investorInterest});
}

class Investor_Data{
  List<Investors> investor_details(){
    List<Investors> investor=[
      Investors(
        investorName: 'Kofi Nunana',
        investorId: 'IN0001',
        investorEmail: 'kofinunana@gmail.com',
        investorphone: '0250250225',
        investorInterest: ['cereals', 'vegetables', 'cash crops'],
        investorLocation: 'Kpando',
        investorImage: 'assets/images/investor.png',
      )
    ];
    return investor;
  }
}

class Farmers {
  String farmerName, farmerAge,farmerContact,farmerLocation,number_of_Plots,farmSize, farmerImage,
  farmerId;
  List speciality;

  Farmers(
      {this.farmerName,
        this.farmerAge,
        this.farmerContact,
        this.farmerLocation,
        this.farmSize,
        this.number_of_Plots,
        this.speciality,
        this.farmerImage,
      this.farmerId});
}
// ignore: camel_case_types
class Farmers_data{
  List<Farmers> farmers_details(){
    List<Farmers> farmers=[
      Farmers(
        farmerAge: '46',
        farmerContact: '+233249381499',
        farmerImage: 'assets/diseases/farmer2.jpg',
        farmerLocation: 'Peki Tsame',
        farmerName: 'Kwesi Awua Dompre',
        farmSize: '15 hectors',
        number_of_Plots: '3',
        farmerId: 'FM0006',
        speciality: ['maize', 'casava', 'yam'],
      )
    ];
    return farmers;
  }
}