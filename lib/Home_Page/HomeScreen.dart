import 'package:agriteck_user/Diseases/Diseases_Screen.dart';
import 'package:agriteck_user/Diseases/diseases.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/DiseasesDetails/diseases_details_Screen.dart';

class diseases_HomeScreen extends StatefulWidget {
  @override
  _diseases_HomeScreenState createState() => _diseases_HomeScreenState();
}

class _diseases_HomeScreenState extends State<diseases_HomeScreen> {
  int CurrentIndex = 0;
  final List<Widget> pages = [
    Diseases(),
    Text('Tab2'),
    Text('Tab3'),
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
            title: Text('Diseases',style: TextStyle(color: Colors.white,
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
        ],
        currentIndex: CurrentIndex,
        onTap: onItemTap,
      ),
    );
  }
}
