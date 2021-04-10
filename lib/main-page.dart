import 'package:agriteck_user/application-pages/welcome_page.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/bottom-icons.dart';
import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/floating-menu.dart';
import 'package:agriteck_user/community-page/commuinity-page.dart';
import 'package:agriteck_user/crops-page/crops-page.dart';
import 'package:agriteck_user/diseases-page/diseases-page.dart';
import 'package:agriteck_user/home-page/home-screen.dart';
import 'package:agriteck_user/investors/investor.dart';
import 'package:agriteck_user/pojo-classes/tips-data.dart';
import 'package:agriteck_user/products-page/products_page.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/vendors/vendor.dart';
import 'package:async_loader/async_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/services.dart';
import 'farms-page/farm-screen.dart';
import 'farms-page/new-farm-page.dart';

enum BottomButtons {
  Crops,
  Farms,
  Home,
  Vendors,
  Market,
  Investors,
  Community,
  Diseases
}

class MainPage extends StatefulWidget {
  final BottomButtons initPage;
  MainPage({Key key, this.initPage}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomButtons selectedPage;
  String userName, userPhone, userImage, userType, pageTitle = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  void initState() {
    selectedPage = widget.initPage;
    getUserType();
    super.initState();
  }

  getUserType() async {
    userType = await SharedPrefs.getUserType();
  }

  getUserInfo() async {
    userName = await SharedPrefs.getUsername();
    userPhone = await SharedPrefs.getUserPhone();
    userImage = await SharedPrefs.getUserPhoto();
  }

  //===============================================================================
// here we check which page we are , then we show the user the corressponding Title on the app bar
  setPageTitle() {
    String title = '';
    if (selectedPage == BottomButtons.Farms) title = 'Farms';
    if (selectedPage == BottomButtons.Diseases) title = 'Diseases';
    if (selectedPage == BottomButtons.Community) title = 'Community';
    if (selectedPage == BottomButtons.Market) title = 'Product List';
    return title;
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
      renderSuccess: ({data}) => Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [primaryDark, primary, primaryLight],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    tileMode: TileMode.clamp)),
            accountName: Text(
              userName != null ? userName : "UserName",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(userPhone != null ? userPhone : "Telephone"),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              backgroundImage: userImage != null
                  ? NetworkImage(userImage)
                  : AssetImage('assets/images/person.png'),
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
              children: [
                _asyncLoader,
                ListTile(
                  leading: Image(
                    width: 24,
                    image: AssetImage('assets/icons/cultivate.png'),
                    color: Colors.black54,
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  title: Text(
                    'Crops',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Send to Crops Page
                    sendToPage(context, CropsScreen());
                  },
                ),
                ListTile(
                  leading: Image(
                    width: 24,
                    image: AssetImage('assets/icons/market.png'),
                    color: Colors.black54,
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  title: Text(
                    'Market',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // Send to Crops Page
                    sendToPage(context, ProductFullScreen());
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text(
                    'Profile',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                    sendToPage(context, WelcomeScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text(
                    'Exit',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: CustomAppBar(
          leadingIcon: Icons.menu,
          title: setPageTitle(),
          onIconPress: () {
            setState(() {
              _scaffoldKey.currentState.openDrawer();
            });
          },
        ),
        floatingActionButton: setFloatBott(selectedPage),
        body: selectedPage == BottomButtons.Home
            ? HomeScreen(
                tips: Tips.testTips()[0],
              )
            : selectedPage == BottomButtons.Community
                ? CommunityScreen()
                : selectedPage == BottomButtons.Diseases
                    ? DiseasesScreen()
                    : selectedPage == BottomButtons.Farms
                        ? FarmScreen()
                        : selectedPage == BottomButtons.Market
                            ? ProductsMidScreen()
                            : Container(),
        bottomNavigationBar: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (userType == 'Farmers')
                BottomIcons(
                  iconColor: Colors.grey,
                  text: 'Home',
                  bottomIcons:
                      selectedPage == BottomButtons.Home ? true : false,
                  icons: 'assets/icons/home.png',
                  textColor: primary,
                  onPressed: () {
                    setState(() {
                      selectedPage = BottomButtons.Home;
                    });
                  },
                  activeColor: primary,
                  activeIconColor: primary,
                ),
              if (userType == 'Farmers')
                BottomIcons(
                  iconColor: Colors.grey,
                  text: 'Diseases',
                  bottomIcons:
                      selectedPage == BottomButtons.Diseases ? true : false,
                  icons: 'assets/icons/cultivate.png',
                  textColor: primary,
                  onPressed: () {
                    setState(() {
                      selectedPage = BottomButtons.Diseases;
                    });
                  },
                  activeColor: primary,
                  activeIconColor: primary,
                ),
              if (userType == 'Farmers' || userType == 'Investors')
                BottomIcons(
                  iconColor: Colors.grey,
                  text: 'Farms',
                  bottomIcons:
                      selectedPage == BottomButtons.Farms ? true : false,
                  icons: 'assets/icons/farm.png',
                  textColor: primary,
                  onPressed: () {
                    setState(() {
                      selectedPage = BottomButtons.Farms;
                    });
                  },
                  activeColor: primary,
                  activeIconColor: primary,
                ),
              BottomIcons(
                iconColor: Colors.grey,
                text: 'Community',
                bottomIcons:
                    selectedPage == BottomButtons.Community ? true : false,
                icons: 'assets/icons/community.png',
                textColor: primary,
                onPressed: () {
                  setState(() {
                    selectedPage = BottomButtons.Community;
                  });
                },
                activeColor: primary,
                activeIconColor: primary,
              ),
              if (userType == 'Vendors')
                BottomIcons(
                  iconColor: Colors.grey,
                  text: 'Market',
                  bottomIcons:
                      selectedPage == BottomButtons.Market ? true : false,
                  icons: 'assets/icons/market.png',
                  textColor: primary,
                  onPressed: () {
                    setState(() {
                      selectedPage = BottomButtons.Market;
                    });
                  },
                  activeColor: primary,
                  activeIconColor: primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
