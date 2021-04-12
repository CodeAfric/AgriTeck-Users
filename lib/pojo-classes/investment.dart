import 'package:cloud_firestore/cloud_firestore.dart';

class Investment {
  String input, payback, investmentID;
  Map farmDetails, inverstorDetails, farmerDetails;
  bool approved, accepted;
  DateTime time, startTime, endTime;
  Investment({
    this.input,
    this.payback,
    this.farmDetails,
    this.farmerDetails,
    this.inverstorDetails,
    this.investmentID,
    this.approved = false,
    this.accepted = false,
  }) : this.time = DateTime.now();

  // Convert a Farmer object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['input'] = input;
    map['investmentID'] = investmentID;
    map['payback'] = payback;
    map['farmDetails'] = farmDetails;
    map['farmerDetails'] = farmerDetails;
    map['inverstorDetails'] = inverstorDetails;
    map['accepted'] = accepted;
    map['approved'] = accepted;
    map['time'] = time;
    return map;
  }

  Investment.fromMapObject(Map<String, dynamic> map) {
    investmentID = map['investmentID'];
    input = map['input'];
    payback = map['payback'];
    farmDetails = map['farmDetails'];
    farmerDetails = map['farmerDetails'];
    inverstorDetails = map['inverstorDetails'];
    accepted = map['accepted'];
    approved = map['approved'];
    time = (map['time'] is Timestamp) ? map['time'].toDate() : map['time'];
  }
}
