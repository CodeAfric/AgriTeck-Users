class CommunityPost {
  String postImage, userImage, userName, userLocation, postTime, cropName, postTitle, postDescription;

  CommunityPost({
    this.postImage,
    this.userImage,
    this.userName,
    this.userLocation,
    this.postTime,
    this.cropName,
    this.postTitle,
    this.postDescription,
});

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['postImage'] = postImage;
    map['userImage'] = userImage;
    map['userName'] = userName;
    map['userLocation'] = userLocation;
    map['postTime'] = postTime;
    map['cropName'] = cropName;
    map['postTitle'] = postTitle;
    map['postDescription'] = postDescription;
    return map;
  }
  CommunityPost.fromMapObject(Map<String, dynamic> map){
    this.postImage = map['postImage'];
    this.userImage = map['userImage'];
    this.userName = map['userName'];
    this.userLocation = map['userLocation'];
    this.postTime = map['postTime'];
    this.cropName = map['cropName'];
    this.postTitle = map['postTitle'];
    this.postDescription = map['postDescription'];

  }
}