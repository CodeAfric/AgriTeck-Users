import 'package:agriteck_user/community/commuinity-page.dart';
import 'package:agriteck_user/crops/crops_screen.dart';
import 'package:agriteck_user/farms/farm_list.dart';
import 'package:agriteck_user/common%20UI/bottom-icons.dart';
import 'package:agriteck_user/common%20UI/floating-buttton.dart';
import 'package:agriteck_user/common%20UI/floating-menu.dart';
import 'package:agriteck_user/investors/investor.dart';
import 'package:agriteck_user/products/products.dart';
import 'package:agriteck_user/vendors/vendor.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    selectedPage = widget.initPaage;
    super.initState();
  }

  Widget setAppBar(selectedPage) {
    return selectedPage != BottomButtons.Home
        ? AppBar(
            backgroundColor: primaryLight.withOpacity(0.7),
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
              style: TextStyle(
                  color: primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    size: 35,
                    color: primaryDark,
                  ),
                  onPressed: () {})
            ],
          )
        : AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          );
  }

  Widget setFloatBott(selectedPage) {
    return selectedPage == BottomButtons.Farms
        ? FloatingMenu(
            // label: 'Post Product',
            animatedIcon: AnimatedIcons.menu_close,
            menuItems: [
              BubbleMenuItem.create(
                label: 'Investors',
                icon: Icons.group,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestorScreen()));
                },
              ),
              BubbleMenuItem.create(
                label: 'Add Farm',
                icon: Icons.add,
                onPress: () {},
              ),
            ],
            // onPressHandler: () {},
          )
        : selectedPage == BottomButtons.Community ||
                selectedPage == BottomButtons.Crops
            ? FloatingButton(
                label: 'Ask Community',
                icon: Icons.edit,
                onPressHandler: () {},
              )
            : selectedPage == BottomButtons.Market
                ? FloatingMenu(
                    // label: 'Post Product',
                    animatedIcon: AnimatedIcons.menu_close,
                    menuItems: [
                      BubbleMenuItem.create(
                        label: 'Vendors',
                        icon: Icons.store,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VendorScreen()));
                        },
                      ),
                      BubbleMenuItem.create(
                        label: 'Post Products',
                        icon: Icons.add,
                        onPress: () {},
                      ),
                    ],
                    // onPressHandler: () {},
                  )
                : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: setAppBar(selectedPage),
      floatingActionButton: setFloatBott(selectedPage),
      body: Container(
        decoration: BoxDecoration(
          color: primaryLight.withOpacity(0.3),
        ),
        child: selectedPage == BottomButtons.Home
            ? Training()
            : selectedPage == BottomButtons.Community
                ? CommunityScreen()
                : selectedPage == BottomButtons.Crops
                    ? CropScreen()
                    : selectedPage == BottomButtons.Farms
                        ? FarmScreen()
                        : selectedPage == BottomButtons.Market
                            ? ProductScreen()
                            : Container(),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primaryLight.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomIcons(
              iconColor: primaryDark,
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
              iconColor: primaryDark,
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
              iconColor: primaryDark,
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
              iconColor: primaryDark,
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
              iconColor: primaryDark,
              text: 'Market',
              bottomIcons: selectedPage == BottomButtons.Market ? true : false,
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
    );
  }
}
