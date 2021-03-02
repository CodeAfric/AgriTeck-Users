import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/Vendors/vendors_investors_Screen.dart';

class vendors_Home extends StatefulWidget {
  @override
  _vendors_HomeState createState() => _vendors_HomeState();
}

class _vendors_HomeState extends State<vendors_Home> {
  int CurrentIndex = 0;
  final List<Widget> pages = [
    Vendors_Investors(),
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