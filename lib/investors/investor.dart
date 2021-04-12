import 'package:agriteck_user/investors/investors-card.dart';
import 'package:agriteck_user/pojo-classes/investors-data.dart';

import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';

class InvestorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getData() async {
      List investorList;
      var userType = await SharedPrefs.getUserType();
      var snapshot;
      if (userType == 'Farmers') {
        snapshot = await DatabaseServices.getDataFromDatabase('Investors');
      }

      investorList = snapshot.docs.toList();
      return investorList;
    }

    final GlobalKey<AsyncLoaderState> _investorsasyncLoaderState =
        new GlobalKey<AsyncLoaderState>();

    var _asyncLoader = new AsyncLoader(
      key: _investorsasyncLoaderState,
      initState: () async => getData(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text('Sorry, there was an error loading your Information'),
      ),
      renderSuccess: ({data}) => ListView.builder(
        padding: EdgeInsets.only(bottom: 80.0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          var investor = InvestorsData.fromMapObject(data[index].data());
          return InkWell(
            child: Container(
              child: InvestorCard(
                investorImage: investor.image,
                investorName: investor.name,
                investorContact: investor.phone,
                investorLoc: investor.location,
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );

    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primary,
              title: Text(
                'Investors',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 61,
                  color: Colors.white,
                  child: _asyncLoader,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
