class CommunityComment{
  String userImage, userName, userLocation, postTime, comment;

  CommunityComment({
    this.userImage, this.userName, this.userLocation, this.postTime, this.comment
});

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['userImage'] = userImage;
    map['userName'] = userName;
    map['userLocation'] = userLocation;
    map['postTime'] = postTime;
    map['comment'] = comment;
    return map;
  }
  CommunityComment.fromMapObject(Map<String, dynamic> map){
    this.userImage = map['userImage'];
    this.userName = map['userName'];
    this.userLocation = map['userLocation'];
    this.postTime = map['postTime'];
    this.comment = map['comment'];
  }
}