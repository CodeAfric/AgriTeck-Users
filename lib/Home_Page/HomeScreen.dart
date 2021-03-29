import 'package:agriteck_user/CropsPage/crops_screen.dart';
import 'package:agriteck_user/Diseases/Diseases_Screen.dart';
import 'package:agriteck_user/FarmsPage/farm_list.dart';
import 'package:agriteck_user/common%20UI/bottom-icons.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/CommunityPage/Commuinity.dart';
import 'package:agriteck_user/Diseases-Training/TrainingScreen.dart';

enum BottomButtons { Crops, Farms, Home, Vendors, Market, Investors, Community }

class HomePage extends StatefulWidget {
  final BottomButtons initPaage;
  HomePage({Key key, this.initPaage}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomButtons selectedPage;

  @override
  void initState() {
    selectedPage = widget.initPaage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedPage == BottomButtons.Home
            ? primaryLight.withOpacity(0.5)
            : primaryDark,
        title: Text(
          selectedPage == BottomButtons.Market
              ? 'Market'
              : selectedPage == BottomButtons.Farms
                  ? 'Farms'
                  : selectedPage == BottomButtons.Crops
                      ? 'Crops'
                      : selectedPage == BottomButtons.Community
                          ? 'Community'
                          : '',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: selectedPage == BottomButtons.Home
            ? Training()
            : selectedPage == BottomButtons.Community
                ? CommunityScreen()
                : selectedPage == BottomButtons.Crops
                    ? CropScreen()
                    : selectedPage == BottomButtons.Farms
                        ? FarmScreen()
                        : selectedPage == BottomButtons.Market
                            ? DiseasesScreen()
                            : Container(),
      ),
      bottomNavigationBar: Container(
        color: primaryLight.withOpacity(0.7),
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomIcons(
                iconColor: primary,
                text: 'Home',
                bottomIcons: selectedPage == BottomButtons.Home ? true : false,
                icons: 'assets/icons/home.png',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Home;
                  });
                },
                activeColor: primary,
                activeIconColor: Colors.white,
              ),
              BottomIcons(
                iconColor: primary,
                text: 'Crops',
                bottomIcons: selectedPage == BottomButtons.Crops ? true : false,
                icons: 'assets/icons/cultivate.png',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Crops;
                  });
                },
                activeColor: primary,
                activeIconColor: Colors.white,
              ),
              BottomIcons(
                iconColor: primary,
                text: 'Farms',
                bottomIcons: selectedPage == BottomButtons.Farms ? true : false,
                icons: 'assets/icons/farm.png',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Farms;
                  });
                },
                activeColor: primary,
                activeIconColor: Colors.white,
              ),
              BottomIcons(
                iconColor: primary,
                text: 'Community',
                bottomIcons:
                    selectedPage == BottomButtons.Community ? true : false,
                icons: 'assets/icons/community.png',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Community;
                  });
                },
                activeColor: primary,
                activeIconColor: Colors.white,
              ),
              BottomIcons(
                iconColor: primary,
                text: 'Market',
                bottomIcons:
                    selectedPage == BottomButtons.Market ? true : false,
                icons: 'assets/icons/market.png',
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Market;
                  });
                },
                activeColor: primary,
                activeIconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
