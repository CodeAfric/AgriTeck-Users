import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/bottom-icons.dart';
import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/floating-menu.dart';
import 'package:agriteck_user/community/commuinity-page.dart';
import 'package:agriteck_user/crops/crops_screen.dart';
import 'package:agriteck_user/farms/farm_list.dart';
import 'package:agriteck_user/farms/new-farm-page.dart';
import 'package:agriteck_user/investors/investor.dart';
import 'package:agriteck_user/products/products.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/vendors/vendor.dart';
import 'package:async_loader/async_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/Diseases-Training/TrainingScreen.dart';
import 'package:flutter/services.dart';

import 'commonly-used-widget/custom-appbar-with-clipper.dart';

enum BottomButtons { Crops, Farms, Home, Vendors, Market, Investors, Community }

class MainPage extends StatefulWidget {
  final BottomButtons initPaage;
  MainPage({Key key, this.initPaage}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomButtons selectedPage;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();
  @override
  void initState() {
    selectedPage = widget.initPaage;
    super.initState();
  }

  String userName, userPhone, userImage;
  getUserInfo() async {
    userName = await SharedPrefs.getUsername();
    userPhone = await SharedPrefs.getUserPhone();
    userImage = await SharedPrefs.getUserPhoto();
  }

  //here we check which page we are, then we display the the corresponding title
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
          )
        : AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          );
  }

//===============================================================================
// here we check which page we are , then we show the user the corressponding floating action buton
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
                onPress: () {
                  setState(() {
                    sendToPage(context, NewFarm());
                  });
                },
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

//================================================================================
  //here we prompt the user when he/she tries to press back on the main page
  //when the user tries to quit the application by pressing back
  Future<bool> _onBackPressed() async {
    return showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: 'Quit !',
                descriptions:
                    'Are you Sure you want to quit this application ?',
                btn1Text: 'No',
                btn2Text: 'Yes',
                img: 'assets/images/warning.png',
                btn1Press: () {
                  Navigator.pop(context);
                },
                btn2Press: () {
                  setState(() {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                },
              );
            }) ??
        false;
  }
//======================================================================
  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getUserInfo(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) =>
          new Text('Sorry, there was an error loading your Information'),
      renderSuccess: ({data}) => ClipPath(
        clipper: CustomDrawerrCliper(),
        child: Container(
          height: 200,

          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: UserAccountsDrawerHeader(
              decoration:BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryDark, primary, primaryLight],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp)) ,
                accountName: Text(userName!=null?userName:"UserName",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                accountEmail: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(userPhone!=null?userPhone:"Telephone"),
                ),
              currentAccountPicture: CircleAvatar(radius: 100,backgroundColor: Colors.white,
                backgroundImage:userImage!=null?NetworkImage(userImage):AssetImage('assets/images/person.png'),
              ),
            ),
          ),
        ),
      ),
    );
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [_asyncLoader],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              selectedPage == BottomButtons.Market
                  ? 'Market'
                  : selectedPage == BottomButtons.Farms
                      ? 'Farms'
                      : selectedPage == BottomButtons.Crops
                          ? 'Crops'
                          : selectedPage == BottomButtons.Community
                              ? 'Community'
                              : selectedPage == BottomButtons.Home
                                  ? 'Home'
                                  : '',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 22),
            ),
            flexibleSpace: ClipPath(
              clipper: CustomAppBarCliper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [primaryDark, primary, primaryLight],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        tileMode: TileMode.clamp)),
              ),
            ),
          ),
        ),
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