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

  CommunityData({this.postImage, this.userImage, this.userName,
    this.userLocation, this.postTime, this.cropName, this.postTitle,
    this.postDescription});



}

class ComunityComent{
  final String comenterName;
  final String comenterImage;
  final String comenterLocation;
  final String comenterTime;
  final String coment;

  ComunityComent({this.comenterName, this.comenterImage, this.comenterLocation, this.comenterTime, this.coment});

  List<ComunityComent>posts(){
    ComunityComent(
      comenterImage: 'assets/diseases/farmer1.jpg',
      comenterName: 'Kojo Rokoto',
      comenterLocation: 'Abetifi tooorr',
      comenterTime: '12/01/2021',
      coment: 'this happened as a result of drought. it can also be that the chemical you used to spray it from the beginig '
          'has an effect on it.',
    );
  }
}

class GenerateData{
  List<CommunityData> community(){
    List<CommunityData> data=[
    CommunityData(
      userName: 'Kwame Addison Boat',
      userImage: 'assets/diseases/farmer1.jpg',
      userLocation: 'Tanoso Kumasi ',
      postImage: 'assets/diseases/disease2.jpg',
      postTime: '12/02/2021',
      postTitle: 'Why this on my crop?',
      postDescription: 'I saw this on my crop earlier today. all the leaves of the crop have holes in them',
      cropName: 'Tomatoes',
    )
    ];
    return data;
  }
}

class GetComent{
  List<ComunityComent> posts(){
    List<ComunityComent> comentData=[
      ComunityComent(
        comenterImage: 'assets/diseases/farmer1.jpg',
        comenterName: 'Kojo Rokoto',
        comenterLocation: 'Abetifi tooorr',
        comenterTime: '12/01/2021',
        coment: 'this happened as a result of drought. it can also be that the chemical you used to spray it from the beginig '
            'has an effect on it.',
      )
    ];
    return comentData;
  }
}