import 'package:flutter/material.dart';



class StoriesUpdate with ChangeNotifier {
  List _storiesData = List();
  List _favouriteStories = List();
  List _myStories = List();

  ///updating individual List
  void updateList(List story, List fav, List myStory) {
    _storiesData = story;
    _favouriteStories = fav;
    _myStories = myStory;
    notifyListeners();
  }

  ///here i get the individual  list
  List get storyData => _storiesData;
  List get favouriteStories => _favouriteStories;
  List get myStories => _myStories;
}


class NavigationUpdate with ChangeNotifier{
  bool isHasSearch=true;
  bool isDrawerOpen=false;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  void updateBool(bool value){
    isHasSearch=value;
  }

  void updateDrawer(bool value,double x,double y, double factor){
    isDrawerOpen=value;
    xOffset=x;
    yOffset=y;
    scaleFactor=factor;
  }


  bool get navState=>isHasSearch;
  bool get drawerBool=>isDrawerOpen;
  double get xVal=>xOffset;
  double get yVal=>yOffset;
  double get scaleVal=>scaleFactor;

}