import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/farms-page/farm-card.dart';
import 'package:agriteck_user/farms-page/farm-details.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';

class FarmsScreen extends StatelessWidget {
  getData() async {
    List farmList;
    var snapshot = await DatabaseServices.getDataFromDatabase('Farms');
    farmList = snapshot.docs.toList();
    return farmList;
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
            var farm = Farm.fromMapObject(data[index].data());
            return InkWell(
              child: FarmCard(
                farmImage: farm.images.length > 0 ? farm.images[0] : null,
                farmName: '${farm.farmerDetails['name']}\'s Farm',
                plantType: farm.cropType,
              ),
              onTap: () {
                sendToPage(
                  context,
                  FarmDetailsScreen(farm: farm),
                );
              },
            );
          }),
    );

    return Column(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: _asyncLoader),
        ),
      ],
    );
  }
}
