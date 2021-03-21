import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/FarmsPage/farms_Screen.dart';

class farms_Home extends StatefulWidget {
  @override
  _farms_HomeState createState() => _farms_HomeState();
}

class _farms_HomeState extends State<farms_Home> {
  int CurrentIndex = 0;
  final List<Widget> pages = [
    Farms(),
    Text('1'),
    Text('2'),
    Text('3'),

    //Text('Yet to be Added', style: TextStyle(fontSize: 25,color: Colors.white),),
  ];
  void onItemTap(int index){
    setState(() {
      CurrentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: Center(
        child: pages.elementAt(CurrentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryDark,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            title: Text('Tab1',style: TextStyle(color: Colors.white,
                fontSize: 16),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            title: Text('Tab2',style: TextStyle(color: Colors.white,
                fontSize: 16),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            title: Text('Tab3', style: TextStyle(color: Colors.white,
                fontSize: 16),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            title: Text('Tab4', style: TextStyle(color: Colors.white,
                fontSize: 16),),
          ),
        ],
        currentIndex: CurrentIndex,
        onTap: onItemTap,
      ),
    );
  }

}