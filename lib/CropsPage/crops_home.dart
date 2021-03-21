import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/CropsPage/crops_screen.dart';

class cropsHome extends StatefulWidget {
  @override
  _cropsHomeState createState() => _cropsHomeState();
}

class _cropsHomeState extends State<cropsHome> {
  int CurrentIndex = 0;
  final List<Widget> pages = [
    cropsPage(),
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
