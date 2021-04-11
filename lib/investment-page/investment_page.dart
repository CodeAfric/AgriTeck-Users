import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/investment-page/investment_card.dart';
import 'package:agriteck_user/investment-page/investment_details.dart';
import 'package:agriteck_user/pojo-classes/investment.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';

class InvestmentScreen extends StatelessWidget {
  getData() async {
    List investmentList;
    var userType = await SharedPrefs.getUserType();
    var userId = await SharedPrefs.getUserID();
    var snapshot;
    if (userType == 'Farmers') {
      snapshot = await DatabaseServices.queryFromDatabaseByField(
          'Investments', 'farmerDetails.farmerId', userId);
    } else if (userType == 'Investors') {
      snapshot = await DatabaseServices.queryFromDatabaseByField(
          'Investments', 'inverstorDetails.investorID', userId);
    }
    investmentList = snapshot.docs.toList();
    return investmentList;
  }

  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => getData(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text('Sorry, there was an error loading your Information'),
      ),
      renderSuccess: ({data}) => ListView.builder(
          padding: EdgeInsets.only(bottom: 80.0),
          itemCount: data.length,
          itemBuilder: (context, index) {
            var investment = Investment.fromMapObject(data[index].data());
            return InkWell(
              child: InvestorCard(
                farmImage: investment.farmDetails['images'].length > 0
                    ? investment.farmDetails['images'][0]
                    : null,
                farmName: '${investment.farmerDetails['name']}\'s Farm',
                investmentInputs: investment.input,
                farmLocation: investment.farmDetails['location'],
              ),
              onTap: () {
                sendToPage(
                  context,
                  InvestmentDetailsScreen(investment: investment),
                );
              },
            );
          }),
    );

    return Column(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: _asyncLoader),
        ),
      ],
    );
  }
}
